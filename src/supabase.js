import { createClient } from '@supabase/supabase-js';
import bcrypt from 'bcryptjs';
import { SUPABASE_URL, SUPABASE_ANON_KEY } from './config.js';

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Funciones de API para eventos
export const eventsAPI = {
  // Obtener todos los eventos
  async getAll() {
    const { data, error } = await supabase
      .from('events')
      .select(`
        *,
        users (
          name
        )
      `)
      .order('start_date', { ascending: true });

    if (error) throw error;
    return data;
  },

  // Crear un nuevo evento
  async create(eventData) {
    const { data, error } = await supabase
      .from('events')
      .insert([eventData])
      .select()
      .single();

    if (error) throw error;
    return data;
  },

  // Actualizar un evento
  async update(id, eventData) {
    const { data, error } = await supabase
      .from('events')
      .update(eventData)
      .eq('id', id)
      .select()
      .single();

    if (error) throw error;
    return data;
  },

  // Eliminar un evento
  async delete(id) {
    const { error } = await supabase
      .from('events')
      .delete()
      .eq('id', id);

    if (error) throw error;
  },

  // Agregar excepción a evento recurrente
  async addException(id, exceptionDate) {
    const { data: event, error: fetchError } = await supabase
      .from('events')
      .select('exceptions')
      .eq('id', id)
      .single();

    if (fetchError) throw fetchError;

    const exceptions = event.exceptions || [];
    exceptions.push(exceptionDate);

    const { data, error } = await supabase
      .from('events')
      .update({ exceptions })
      .eq('id', id)
      .select()
      .single();

    if (error) throw error;
    return data;
  }
};

// Funciones de API para usuarios
export const usersAPI = {
  // Obtener todos los usuarios
  async getAll() {
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .order('name');

    if (error) throw error;
    return data;
  },

  // Crear un nuevo usuario
  async create(userData) {
    const { data, error } = await supabase
      .from('users')
      .insert([userData])
      .select()
      .single();

    if (error) throw error;
    return data;
  },

  // Obtener usuario por username
  async getByUsername(username) {
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .eq('username', username)
      .single();

    if (error) throw error;
    return data;
  },

  // Actualizar contraseña de usuario
  async updatePassword(userId, newPasswordHash) {
    const { data, error } = await supabase
      .from('users')
      .update({ password_hash: newPasswordHash })
      .eq('id', userId)
      .select()
      .single();

    if (error) throw error;
    return data;
  }
};

// Funciones de API para filtros
export const filtersAPI = {
  // Obtener filtros de un usuario
  async getUserFilters(userId) {
    const { data, error } = await supabase
      .from('user_filters')
      .select('*')
      .eq('user_id', userId);

    if (error) throw error;
    return data;
  },

  // Guardar filtro de usuario
  async saveUserFilter(userId, filterType, filterKey, enabled) {
    const { data, error } = await supabase
      .from('user_filters')
      .upsert({
        user_id: userId,
        filter_type: filterType,
        filter_key: filterKey,
        enabled
      })
      .select()
      .single();

    if (error) throw error;
    return data;
  },

  // Actualizar múltiples filtros
  async updateUserFilters(userId, filters) {
    // Primero eliminamos todos los filtros existentes
    await supabase
      .from('user_filters')
      .delete()
      .eq('user_id', userId);

    // Luego insertamos los nuevos
    const filterInserts = [];
    Object.entries(filters).forEach(([key, value]) => {
      if (key === 'users') {
        // Filtros de usuarios
        value.forEach(user => {
          filterInserts.push({
            user_id: userId,
            filter_type: 'user',
            filter_key: user,
            enabled: true
          });
        });
      } else if (typeof value === 'boolean') {
        // Filtros de tipos de evento
        filterInserts.push({
          user_id: userId,
          filter_type: 'event_type',
          filter_key: key,
          enabled: value
        });
      }
    });

    if (filterInserts.length > 0) {
      const { data, error } = await supabase
        .from('user_filters')
        .insert(filterInserts)
        .select();

      if (error) throw error;
      return data;
    }

    return [];
  }
};

// Función para suscribirse a cambios en tiempo real
export const subscribeToEvents = (callback) => {
  return supabase
    .channel('events_changes')
    .on('postgres_changes',
      { event: '*', schema: 'public', table: 'events' },
      callback
    )
    .subscribe();
};

// Funciones de autenticación
export const authAPI = {
  // Login de usuario
  async login(username, password) {
    try {
      // Obtener usuario por username
      const user = await usersAPI.getByUsername(username);

      // Verificar contraseña
      const isValidPassword = await bcrypt.compare(password, user.password_hash);

      if (!isValidPassword) {
        throw new Error('Contraseña incorrecta');
      }

      // Retornar usuario sin el hash de la contraseña
      const { password_hash, ...userWithoutPassword } = user;
      return userWithoutPassword;
    } catch (error) {
      console.error('Error en login:', error);
      throw error;
    }
  },

  // Cambiar contraseña
  async changePassword(userId, currentPassword, newPassword) {
    try {
      // Obtener usuario actual
      const { data: user, error } = await supabase
        .from('users')
        .select('*')
        .eq('id', userId)
        .single();

      if (error) throw error;

      // Verificar contraseña actual
      const isValidPassword = await bcrypt.compare(currentPassword, user.password_hash);

      if (!isValidPassword) {
        throw new Error('Contraseña actual incorrecta');
      }

      // Hash de la nueva contraseña
      const newPasswordHash = await bcrypt.hash(newPassword, 10);

      // Actualizar contraseña
      await usersAPI.updatePassword(userId, newPasswordHash);

      return { success: true };
    } catch (error) {
      console.error('Error al cambiar contraseña:', error);
      throw error;
    }
  },

  // Guardar sesión en localStorage
  saveSession(user) {
    localStorage.setItem('currentUser', JSON.stringify(user));
  },

  // Obtener sesión de localStorage
  getSession() {
    const userStr = localStorage.getItem('currentUser');
    return userStr ? JSON.parse(userStr) : null;
  },

  // Cerrar sesión
  logout() {
    localStorage.removeItem('currentUser');
  }
};

// Funciones de API para auditoría
export const auditAPI = {
  // Obtener todos los registros de auditoría
  async getAll(limit = 100) {
    const { data, error } = await supabase
      .from('audit_logs_view')
      .select('*')
      .order('created_at', { ascending: false })
      .limit(limit);

    if (error) throw error;
    return data;
  },

  // Obtener registros por usuario
  async getByUser(userName, limit = 100) {
    const { data, error } = await supabase
      .from('audit_logs_view')
      .select('*')
      .eq('user_name', userName)
      .order('created_at', { ascending: false })
      .limit(limit);

    if (error) throw error;
    return data;
  },

  // Obtener registros por tipo de acción
  async getByActionType(actionType, limit = 100) {
    const { data, error } = await supabase
      .from('audit_logs_view')
      .select('*')
      .eq('action_type', actionType)
      .order('created_at', { ascending: false })
      .limit(limit);

    if (error) throw error;
    return data;
  },

  // Obtener registros por rango de fechas
  async getByDateRange(startDate, endDate, limit = 100) {
    const { data, error } = await supabase
      .from('audit_logs_view')
      .select('*')
      .gte('created_at', startDate)
      .lte('created_at', endDate)
      .order('created_at', { ascending: false })
      .limit(limit);

    if (error) throw error;
    return data;
  },

  // Registrar acción manual (login, logout, etc.)
  async log(logData) {
    const { data, error } = await supabase
      .from('audit_logs')
      .insert([{
        user_id: logData.userId,
        user_name: logData.userName,
        action_type: logData.actionType,
        entity_type: logData.entityType || 'user',
        entity_id: logData.entityId || null,
        description: logData.description,
        old_values: logData.oldValues || null,
        new_values: logData.newValues || null
      }])
      .select()
      .single();

    if (error) throw error;
    return data;
  },

  // Obtener estadísticas de auditoría
  async getStats() {
    const { data, error } = await supabase
      .from('audit_logs')
      .select('user_name, action_type');

    if (error) throw error;

    // Agrupar estadísticas
    const stats = {};
    data.forEach(log => {
      if (!stats[log.user_name]) {
        stats[log.user_name] = {
          total: 0,
          CREATE: 0,
          UPDATE: 0,
          DELETE: 0,
          LOGIN: 0,
          LOGOUT: 0,
          PASSWORD_CHANGE: 0
        };
      }
      stats[log.user_name].total++;
      stats[log.user_name][log.action_type]++;
    });

    return stats;
  }
};

// Suscribirse a cambios en audit logs
export const subscribeToAuditLogs = (callback) => {
  return supabase
    .channel('audit_logs_changes')
    .on('postgres_changes',
      { event: 'INSERT', schema: 'public', table: 'audit_logs' },
      callback
    )
    .subscribe();
};