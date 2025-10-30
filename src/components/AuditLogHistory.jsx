import React, { useState, useEffect } from 'react';
import { auditAPI, subscribeToAuditLogs } from '../supabase.js';

const AuditLogHistory = ({ currentUser, onClose }) => {
    const [auditLogs, setAuditLogs] = useState([]);
    const [filteredLogs, setFilteredLogs] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [stats, setStats] = useState({});

    // Filtros
    const [filters, setFilters] = useState({
        actionType: 'ALL',
        userName: 'ALL',
        dateRange: '7', // días
        searchTerm: ''
    });

    const actionTypes = {
        ALL: 'Todas las acciones',
        CREATE: 'Creaciones',
        UPDATE: 'Actualizaciones',
        DELETE: 'Eliminaciones',
        LOGIN: 'Inicios de sesión',
        LOGOUT: 'Cierres de sesión',
        PASSWORD_CHANGE: 'Cambios de contraseña'
    };

    const actionTypeColors = {
        CREATE: '#10b981',
        UPDATE: '#3b82f6',
        DELETE: '#ef4444',
        LOGIN: '#8b5cf6',
        LOGOUT: '#6b7280',
        PASSWORD_CHANGE: '#f59e0b'
    };

    const actionTypeIcons = {
        CREATE: '➕',
        UPDATE: '✏️',
        DELETE: '🗑️',
        LOGIN: '🔓',
        LOGOUT: '🔒',
        PASSWORD_CHANGE: '🔑'
    };

    // Cargar datos iniciales
    useEffect(() => {
        loadAuditLogs();
        loadStats();
    }, []);

    // Suscribirse a cambios en tiempo real
    useEffect(() => {
        const subscription = subscribeToAuditLogs((payload) => {
            console.log('Nuevo registro de auditoría:', payload);
            loadAuditLogs();
        });

        return () => {
            subscription.unsubscribe();
        };
    }, []);

    // Aplicar filtros cuando cambien
    useEffect(() => {
        applyFilters();
    }, [auditLogs, filters]);

    const loadAuditLogs = async () => {
        try {
            setLoading(true);
            const data = await auditAPI.getAll(500); // Últimos 500 registros
            setAuditLogs(data);
            setError(null);
        } catch (err) {
            console.error('Error al cargar registros de auditoría:', err);
            setError('Error al cargar el historial de cambios');
        } finally {
            setLoading(false);
        }
    };

    const loadStats = async () => {
        try {
            const statsData = await auditAPI.getStats();
            setStats(statsData);
        } catch (err) {
            console.error('Error al cargar estadísticas:', err);
        }
    };

    const applyFilters = () => {
        let filtered = [...auditLogs];

        // Filtro por tipo de acción
        if (filters.actionType !== 'ALL') {
            filtered = filtered.filter(log => log.action_type === filters.actionType);
        }

        // Filtro por usuario
        if (filters.userName !== 'ALL') {
            filtered = filtered.filter(log => log.user_name === filters.userName);
        }

        // Filtro por rango de fechas
        if (filters.dateRange !== 'ALL') {
            const days = parseInt(filters.dateRange);
            const cutoffDate = new Date();
            cutoffDate.setDate(cutoffDate.getDate() - days);
            filtered = filtered.filter(log => new Date(log.created_at) >= cutoffDate);
        }

        // Filtro por término de búsqueda
        if (filters.searchTerm) {
            const searchLower = filters.searchTerm.toLowerCase();
            filtered = filtered.filter(log =>
                log.description.toLowerCase().includes(searchLower) ||
                log.user_name.toLowerCase().includes(searchLower) ||
                (log.event_title && log.event_title.toLowerCase().includes(searchLower))
            );
        }

        setFilteredLogs(filtered);
    };

    const getUniqueUserNames = () => {
        const names = new Set(auditLogs.map(log => log.user_name));
        return Array.from(names).sort();
    };

    const formatDate = (dateString) => {
        const date = new Date(dateString);
        const now = new Date();
        const diffMs = now - date;
        const diffMins = Math.floor(diffMs / 60000);
        const diffHours = Math.floor(diffMs / 3600000);
        const diffDays = Math.floor(diffMs / 86400000);

        if (diffMins < 1) return 'Hace un momento';
        if (diffMins < 60) return `Hace ${diffMins} minuto${diffMins > 1 ? 's' : ''}`;
        if (diffHours < 24) return `Hace ${diffHours} hora${diffHours > 1 ? 's' : ''}`;
        if (diffDays < 7) return `Hace ${diffDays} día${diffDays > 1 ? 's' : ''}`;

        return new Intl.DateTimeFormat('es-ES', {
            day: '2-digit',
            month: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        }).format(date);
    };

    const getChangeSummary = (log) => {
        if (log.action_type === 'CREATE') {
            return { title: 'Nuevo registro creado', color: actionTypeColors.CREATE };
        }
        if (log.action_type === 'DELETE') {
            return { title: 'Registro eliminado', color: actionTypeColors.DELETE };
        }
        if (log.action_type === 'UPDATE' && log.old_values && log.new_values) {
            const changes = [];
            const oldVal = log.old_values;
            const newVal = log.new_values;

            // Detectar cambios importantes
            if (oldVal.title !== newVal.title) {
                changes.push(`Título: "${oldVal.title}" → "${newVal.title}"`);
            }
            if (oldVal.start_date !== newVal.start_date || oldVal.end_date !== newVal.end_date) {
                changes.push(`Fechas modificadas`);
            }
            if (oldVal.type !== newVal.type) {
                changes.push(`Tipo: ${oldVal.type} → ${newVal.type}`);
            }

            return {
                title: changes.length > 0 ? changes.join(', ') : 'Registro actualizado',
                color: actionTypeColors.UPDATE
            };
        }
        return { title: log.description, color: actionTypeColors[log.action_type] || '#6b7280' };
    };

    const exportToCSV = () => {
        const headers = ['Fecha', 'Usuario', 'Acción', 'Descripción', 'Detalles'];
        const rows = filteredLogs.map(log => [
            new Date(log.created_at).toLocaleString('es-ES'),
            log.user_name,
            log.action_type,
            log.description,
            log.event_title || ''
        ]);

        const csvContent = [
            headers.join(','),
            ...rows.map(row => row.map(cell => `"${cell}"`).join(','))
        ].join('\n');

        const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = `historial-cambios-${new Date().toISOString().split('T')[0]}.csv`;
        link.click();
    };

    if (loading) {
        return (
            <div className="modal">
                <div className="modal-content">
                    <div className="modal-body" style={{ textAlign: 'center', padding: '3rem' }}>
                        <div style={{ fontSize: '2rem', marginBottom: '1rem' }}>⏳</div>
                        <p>Cargando historial de cambios...</p>
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className="modal">
            <div className="modal-content" style={{ maxWidth: '1200px' }}>
                <div className="modal-header">
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                        <div>
                            <h2 className="modal-title">📋 Historial de Cambios y Registro de Auditoría</h2>
                            <p style={{ color: '#6b7280', fontSize: '0.875rem', marginTop: '0.5rem' }}>
                                Registro completo de todas las modificaciones realizadas en el calendario
                            </p>
                        </div>
                        <button onClick={onClose} className="btn btn-secondary">✕ Cerrar</button>
                    </div>
                </div>

                {/* Estadísticas rápidas */}
                <div style={{ padding: '1.5rem', borderBottom: '1px solid #e5e7eb', background: '#f9fafb' }}>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(150px, 1fr))', gap: '1rem' }}>
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ fontSize: '1.5rem', fontWeight: 'bold', color: '#1f2937' }}>
                                {auditLogs.length}
                            </div>
                            <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>Total de Registros</div>
                        </div>
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ fontSize: '1.5rem', fontWeight: 'bold', color: actionTypeColors.CREATE }}>
                                {auditLogs.filter(l => l.action_type === 'CREATE').length}
                            </div>
                            <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>Creaciones</div>
                        </div>
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ fontSize: '1.5rem', fontWeight: 'bold', color: actionTypeColors.UPDATE }}>
                                {auditLogs.filter(l => l.action_type === 'UPDATE').length}
                            </div>
                            <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>Modificaciones</div>
                        </div>
                        <div style={{ textAlign: 'center' }}>
                            <div style={{ fontSize: '1.5rem', fontWeight: 'bold', color: actionTypeColors.DELETE }}>
                                {auditLogs.filter(l => l.action_type === 'DELETE').length}
                            </div>
                            <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>Eliminaciones</div>
                        </div>
                    </div>
                </div>

                {/* Filtros */}
                <div style={{ padding: '1.5rem', borderBottom: '1px solid #e5e7eb' }}>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '1rem', marginBottom: '1rem' }}>
                        <div>
                            <label className="form-label">Tipo de Acción</label>
                            <select
                                className="form-select"
                                value={filters.actionType}
                                onChange={(e) => setFilters({ ...filters, actionType: e.target.value })}
                            >
                                {Object.entries(actionTypes).map(([key, label]) => (
                                    <option key={key} value={key}>{label}</option>
                                ))}
                            </select>
                        </div>
                        <div>
                            <label className="form-label">Usuario</label>
                            <select
                                className="form-select"
                                value={filters.userName}
                                onChange={(e) => setFilters({ ...filters, userName: e.target.value })}
                            >
                                <option value="ALL">Todos los usuarios</option>
                                {getUniqueUserNames().map(name => (
                                    <option key={name} value={name}>{name}</option>
                                ))}
                            </select>
                        </div>
                        <div>
                            <label className="form-label">Período</label>
                            <select
                                className="form-select"
                                value={filters.dateRange}
                                onChange={(e) => setFilters({ ...filters, dateRange: e.target.value })}
                            >
                                <option value="1">Últimas 24 horas</option>
                                <option value="7">Últimos 7 días</option>
                                <option value="30">Últimos 30 días</option>
                                <option value="90">Últimos 90 días</option>
                                <option value="ALL">Todo el historial</option>
                            </select>
                        </div>
                        <div>
                            <label className="form-label">Buscar</label>
                            <input
                                type="text"
                                className="form-input"
                                placeholder="Buscar en descripciones..."
                                value={filters.searchTerm}
                                onChange={(e) => setFilters({ ...filters, searchTerm: e.target.value })}
                            />
                        </div>
                    </div>
                    <div style={{ display: 'flex', gap: '0.5rem', justifyContent: 'flex-end' }}>
                        <button
                            onClick={() => setFilters({ actionType: 'ALL', userName: 'ALL', dateRange: '7', searchTerm: '' })}
                            className="btn btn-secondary"
                        >
                            🔄 Limpiar Filtros
                        </button>
                        <button
                            onClick={exportToCSV}
                            className="btn btn-primary"
                        >
                            📥 Exportar a CSV
                        </button>
                    </div>
                </div>

                {/* Lista de registros */}
                <div className="modal-body" style={{ maxHeight: '60vh', overflowY: 'auto' }}>
                    {error && (
                        <div style={{ background: '#fee2e2', border: '1px solid #ef4444', padding: '1rem', borderRadius: '0.5rem', marginBottom: '1rem' }}>
                            {error}
                        </div>
                    )}

                    {filteredLogs.length === 0 ? (
                        <div style={{ textAlign: 'center', padding: '3rem', color: '#6b7280' }}>
                            <div style={{ fontSize: '3rem', marginBottom: '1rem' }}>📭</div>
                            <p>No se encontraron registros con los filtros aplicados</p>
                        </div>
                    ) : (
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
                            {filteredLogs.map((log, index) => {
                                const changeSummary = getChangeSummary(log);
                                return (
                                    <div
                                        key={log.id || index}
                                        style={{
                                            border: '1px solid #e5e7eb',
                                            borderLeft: `4px solid ${changeSummary.color}`,
                                            borderRadius: '0.5rem',
                                            padding: '1rem',
                                            background: 'white',
                                            transition: 'all 0.2s'
                                        }}
                                        onMouseEnter={(e) => e.currentTarget.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)'}
                                        onMouseLeave={(e) => e.currentTarget.style.boxShadow = 'none'}
                                    >
                                        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start' }}>
                                            <div style={{ flex: 1 }}>
                                                <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.5rem' }}>
                                                    <span style={{ fontSize: '1.25rem' }}>
                                                        {actionTypeIcons[log.action_type]}
                                                    </span>
                                                    <span
                                                        style={{
                                                            background: changeSummary.color,
                                                            color: 'white',
                                                            padding: '0.25rem 0.5rem',
                                                            borderRadius: '0.25rem',
                                                            fontSize: '0.75rem',
                                                            fontWeight: '600'
                                                        }}
                                                    >
                                                        {actionTypes[log.action_type]}
                                                    </span>
                                                    <span style={{ fontSize: '0.875rem', fontWeight: '600', color: '#1f2937' }}>
                                                        {log.user_name}
                                                    </span>
                                                </div>
                                                <div style={{ fontSize: '0.875rem', color: '#374151', marginBottom: '0.5rem' }}>
                                                    {log.description}
                                                </div>
                                                {log.event_title && (
                                                    <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>
                                                        Evento: <strong>{log.event_title}</strong>
                                                        {log.event_type && ` (${log.event_type})`}
                                                    </div>
                                                )}
                                                {changeSummary.title !== log.description && (
                                                    <div style={{ fontSize: '0.75rem', color: '#6b7280', marginTop: '0.25rem', fontStyle: 'italic' }}>
                                                        {changeSummary.title}
                                                    </div>
                                                )}
                                            </div>
                                            <div style={{ textAlign: 'right', minWidth: '140px' }}>
                                                <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>
                                                    {formatDate(log.created_at)}
                                                </div>
                                                <div style={{ fontSize: '0.7rem', color: '#9ca3af' }}>
                                                    {log.formatted_date}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                );
                            })}
                        </div>
                    )}
                </div>

                <div style={{ padding: '1rem', borderTop: '1px solid #e5e7eb', background: '#f9fafb', textAlign: 'center', fontSize: '0.75rem', color: '#6b7280' }}>
                    Mostrando {filteredLogs.length} de {auditLogs.length} registros
                </div>
            </div>
        </div>
    );
};

export default AuditLogHistory;
