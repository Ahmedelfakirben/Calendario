import React, { useState, useEffect } from 'react';
import { eventsAPI, usersAPI, subscribeToEvents, authAPI } from './supabase.js';
import LoginPage from './components/LoginPage.jsx';
import ChangePasswordModal from './components/ChangePasswordModal.jsx';

const CAUCalendar = () => {
    const [currentUser, setCurrentUser] = useState(null);
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [showChangePassword, setShowChangePassword] = useState(false);
    const [currentDate, setCurrentDate] = useState(new Date());
    const [selectedDate, setSelectedDate] = useState(new Date());
    const [events, setEvents] = useState([]);
    const [users, setUsers] = useState([]);
    const [currentView, setCurrentView] = useState('monthly');
    const [showModal, setShowModal] = useState(false);
    const [editingEvent, setEditingEvent] = useState(null);
    const [showDashboard, setShowDashboard] = useState(false);
    const [showExportNote, setShowExportNote] = useState(false);
    const [filters, setFilters] = useState({
        vacaciones: true,
        guardias: true,
        visitas: true,
        reuniones: true,
        jornada: true,
        ofi: true,
        compras: true,
        manuales: true,
        users: []
    });
    const [showFilters, setShowFilters] = useState(false);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const eventTypes = {
        vacaciones: { label: 'Vacaciones', color: 'vacaciones', code: 'V' },
        guardias: { label: 'Guardias', color: 'guardias', code: 'G' },
        visitas: { label: 'Visitas Medicas', color: 'visitas', code: 'VM' },
        reuniones: { label: 'Reuniones', color: 'reuniones', code: 'R' },
        jornada: { label: 'Jornada 18:30', color: 'jornada', code: 'J-18:30' },
        ofi: { label: 'Ofi', color: 'ofi', code: 'OFI' },
        compras: { label: 'Compras', color: 'compras', code: 'C' },
        manuales: { label: 'Manuales', color: 'manuales', code: 'M' }
    };

    const [newEvent, setNewEvent] = useState({
        title: '',
        type: 'vacaciones',
        user_id: '',
        startDate: '',
        endDate: '',
        startTime: '',
        endTime: '',
        description: '',
        repetitionFrequency: '',
        repetitionInterval: 1,
        repetitionWeekdays: [],
        exceptions: []
    });

    const generateHours = () => {
        const hours = [];
        for (let i = 8; i <= 18; i++) {
            hours.push(`${i}:00`);
            if (i < 18) hours.push(`${i}:30`);
        }
        return hours;
    };

    const hours = generateHours();

    // Verificar sesión al cargar
    useEffect(() => {
        const session = authAPI.getSession();
        if (session) {
            setCurrentUser(session);
            setIsAuthenticated(true);
        }
    }, []);

    // Cargar datos iniciales
    useEffect(() => {
        if (isAuthenticated) {
            loadInitialData();
        }
    }, [isAuthenticated]);

    // Suscribirse a cambios en tiempo real
    useEffect(() => {
        if (!isAuthenticated) return;

        const subscription = subscribeToEvents((payload) => {
            console.log('Cambio en eventos:', payload);
            loadEvents();
        });

        return () => {
            subscription.unsubscribe();
        };
    }, [isAuthenticated]);

    const loadInitialData = async () => {
        try {
            setLoading(true);
            setError(null);

            // Cargar usuarios y eventos en paralelo
            const [usersData, eventsData] = await Promise.all([
                usersAPI.getAll(),
                eventsAPI.getAll()
            ]);

            setUsers(usersData);
            setEvents(eventsData.map(event => ({
                ...event,
                user: event.users?.name || 'Usuario desconocido'
            })));

        } catch (err) {
            console.error('Error cargando datos:', err);
            setError('Error al cargar los datos. Verifica tu conexión a Supabase.');
        } finally {
            setLoading(false);
        }
    };

    const loadEvents = async () => {
        try {
            const eventsData = await eventsAPI.getAll();
            setEvents(eventsData.map(event => ({
                ...event,
                user: event.users?.name || 'Usuario desconocido'
            })));
        } catch (err) {
            console.error('Error cargando eventos:', err);
        }
    };

    const months = [
        'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];

    const weekDays = ['Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab', 'Dom'];

    const getDaysInMonth = (date) => {
        const year = date.getFullYear();
        const month = date.getMonth();
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        const daysInMonth = lastDay.getDate();

        const startingDayOfWeek = firstDay.getDay();
        const adjustedStartingDay = startingDayOfWeek === 0 ? 6 : startingDayOfWeek - 1;

        const days = [];

        for (let i = 0; i < adjustedStartingDay; i++) {
            days.push(null);
        }

        for (let i = 1; i <= daysInMonth; i++) {
            days.push(new Date(year, month, i));
        }

        return days;
    };

    const getEventsForDate = (date) => {
        if (!date) return [];

        const filteredEvents = events.filter(event => {
            const eventStart = new Date(event.start_date);
            const eventEnd = new Date(event.end_date);
            const checkDate = new Date(date);

            eventStart.setHours(0, 0, 0, 0);
            eventEnd.setHours(0, 0, 0, 0);
            checkDate.setHours(0, 0, 0, 0);

            const isInDateRange = checkDate >= eventStart && checkDate <= eventEnd;
            if (!isInDateRange) return false;

            const isException = Array.isArray(event.exceptions) && event.exceptions.includes(checkDate.toISOString().split('T')[0]);
            if (isException) return false;

            if (!event.repetition_frequency) {
                return true;
            }

            if (event.repetition_frequency === 'daily') {
                return true;
            }

            if (event.repetition_frequency === 'weekly') {
                if (!Array.isArray(event.repetition_weekdays) || event.repetition_weekdays.length === 0) return false;
                const dayIndex = checkDate.getDay();
                const adjustedDayIndex = dayIndex === 0 ? 6 : dayIndex - 1;
                return event.repetition_weekdays.includes(adjustedDayIndex);
            }

            if (event.repetition_frequency === 'everyXWeeks') {
                if (!Array.isArray(event.repetition_weekdays) || event.repetition_weekdays.length === 0) return false;
                const eventStartDay = new Date(event.start_date);
                eventStartDay.setHours(0,0,0,0);
                const daysSinceStart = Math.floor((checkDate - eventStartDay) / (1000 * 60 * 60 * 24));
                if (daysSinceStart < 0) return false;
                const weeksSinceStart = Math.floor(daysSinceStart / 7);
                const interval = (event.repetition_interval && event.repetition_interval > 0) ? event.repetition_interval : 1;
                const isRepetitionWeek = (weeksSinceStart % interval === 0);
                const dayIndex = checkDate.getDay();
                const adjustedDayIndex = dayIndex === 0 ? 6 : dayIndex - 1;
                return isRepetitionWeek && event.repetition_weekdays.includes(adjustedDayIndex);
            }
            return false;
        }).filter(event => {
            const typeFilter = filters.hasOwnProperty(event.type) ? filters[event.type] : true;
            const userFilter = filters.users.length === 0 || filters.users.includes(event.user);

            const shouldShow = typeFilter && userFilter;

            return shouldShow;
        });
        return filteredEvents;
    };

    const getEventsForHour = (date, hour) => {
        const dayEvents = getEventsForDate(date);
        return dayEvents.filter(event => {
            if (!event.start_time && !event.end_time) return false;

            const eventStartTime = event.start_time;
            const eventEndTime = event.end_time || event.start_time;

            const hourToMinutes = (timeStr) => {
                const [h, m] = timeStr.split(':').map(Number);
                return h * 60 + m;
            };

            const currentHourMinutes = hourToMinutes(hour);
            const startMinutes = hourToMinutes(eventStartTime);
            const endMinutes = hourToMinutes(eventEndTime);

            return currentHourMinutes >= startMinutes && currentHourMinutes < endMinutes + 30;
        });
    };

    const getUserStats = (year = currentDate.getFullYear()) => {
        const yearEvents = events.filter(event => {
            const eventDate = new Date(event.start_date);
            return eventDate.getFullYear() === year;
        });

        return users.map(user => {
            const userEvents = yearEvents.filter(event => event.user === user.name);

            const stats = {
                vacaciones: 0,
                guardias: 0,
                visitas: 0,
                reuniones: 0,
                jornada: 0,
                ofi: 0,
                compras: 0,
                manuales: 0
            };

            userEvents.forEach(event => {
                const startDate = new Date(event.start_date);
                const endDate = new Date(event.end_date);
                startDate.setHours(0,0,0,0);
                endDate.setHours(0,0,0,0);
                const daysDiff = Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24)) + 1;

                if (event.type === 'visitas' || event.type === 'reuniones') {
                    stats[event.type] += 1;
                } else if (stats.hasOwnProperty(event.type)) {
                    if (!event.repetition_frequency) {
                        stats[event.type] += daysDiff;
                    } else {
                        if (event.repetition_frequency === 'daily') {
                            stats[event.type] += daysDiff - (Array.isArray(event.exceptions) ? event.exceptions.length : 0);
                        } else {
                            let repeatedDaysCount = 0;
                            let current = new Date(startDate);
                            while (current <= endDate) {
                                const isException = Array.isArray(event.exceptions) && event.exceptions.includes(current.toISOString().split('T')[0]);
                                if (isException) {
                                    current.setDate(current.getDate() + 1);
                                    continue;
                                }

                                const dayIndex = current.getDay();
                                const adjustedDayIndex = dayIndex === 0 ? 6 : dayIndex - 1;
                                const dayMatches = Array.isArray(event.repetition_weekdays) && event.repetition_weekdays.includes(adjustedDayIndex);
                                const isEveryXWeeks = event.repetition_frequency === 'everyXWeeks';
                                const eventStartDay = new Date(event.start_date);
                                eventStartDay.setHours(0,0,0,0);
                                const daysSinceStart = Math.floor((current - eventStartDay) / (1000 * 60 * 60 * 24));
                                const weeksSinceStart = Math.floor(daysSinceStart / 7);
                                const interval = (event.repetition_interval && event.repetition_interval > 0) ? event.repetition_interval : 1;
                                const isRepetitionWeek = isEveryXWeeks ? (weeksSinceStart % interval === 0) : true;

                                if (dayMatches && (!isEveryXWeeks || isRepetitionWeek)) {
                                    repeatedDaysCount++;
                                }
                                current.setDate(current.getDate() + 1);
                            }
                            stats[event.type] += repeatedDaysCount;
                        }
                    }
                }
            });

            return {
                name: user.name,
                ...stats,
                total: stats.vacaciones + stats.guardias + stats.visitas + stats.reuniones + stats.jornada + stats.ofi + stats.compras + stats.manuales
            };
        });
    };

    const handlePrevMonth = () => {
        if (currentView === 'yearly') {
            setCurrentDate(new Date(currentDate.getFullYear() - 1, currentDate.getMonth()));
        } else {
            setCurrentDate(new Date(currentDate.getFullYear(), currentDate.getMonth() - 1));
        }
    };

    const handleNextMonth = () => {
        if (currentView === 'yearly') {
            setCurrentDate(new Date(currentDate.getFullYear() + 1, currentDate.getMonth()));
        } else {
            setCurrentDate(new Date(currentDate.getFullYear(), currentDate.getMonth() + 1));
        }
    };

    const handleDayClick = (date) => {
        if (!date) return;
        setSelectedDate(date);
        setCurrentView('daily');
    };

    const handleAddEvent = (date = null, hour = null) => {
        setEditingEvent(null);
        const eventDate = date || selectedDate || currentDate;
        const dateStr = eventDate.toISOString().split('T')[0];

        let defaultStartTime = hour || '';
        let defaultEndTime = hour || '';

        if (hour && hour === '18:30') {
            defaultStartTime = '18:30';
            defaultEndTime = '19:00';
        }

        setNewEvent({
            title: '',
            type: 'vacaciones',
            user_id: '',
            startDate: dateStr,
            endDate: dateStr,
            startTime: defaultStartTime,
            endTime: defaultEndTime,
            description: '',
            repetitionFrequency: '',
            repetitionInterval: 1,
            repetitionWeekdays: [],
            exceptions: []
        });
        setShowModal(true);
    };

    const handleEditEvent = (event) => {
        setEditingEvent(event);
        setNewEvent({
            ...event,
            startDate: event.start_date,
            endDate: event.end_date,
            startTime: event.start_time || '',
            endTime: event.end_time || '',
            repetitionFrequency: event.repetition_frequency || '',
            repetitionInterval: event.repetition_interval || 1,
            repetitionWeekdays: event.repetition_weekdays || [],
            exceptions: event.exceptions || [],
            user_id: event.user_id
        });
        setShowModal(true);
    };

    const handleDeleteEvent = async (eventToDelete, eventDate) => {
        try {
            if (eventToDelete.repetition_frequency) {
                const response = prompt('Este es un evento recurrente. ¿Deseas eliminar solo este evento (S) o toda la serie (T)? Escribe \'S\' o \'T\'.');
                if (response && (response.toUpperCase() === 'S' || response.toUpperCase() === 'T')) {
                    if (response.toUpperCase() === 'T') {
                        await eventsAPI.delete(eventToDelete.id);
                        await loadEvents();
                    } else if (response.toUpperCase() === 'S') {
                        const dateToDelete = eventDate.toISOString().split('T')[0];
                        await eventsAPI.addException(eventToDelete.id, dateToDelete);
                        await loadEvents();
                    }
                } else {
                    alert('Opción no valida. Por favor, escribe \'S\' o \'T\'.');
                }
            } else {
                const confirmed = window.confirm('¿Estás seguro de que quieres eliminar este evento?');
                if (confirmed) {
                    await eventsAPI.delete(eventToDelete.id);
                    await loadEvents();
                }
            }
        } catch (err) {
            console.error('Error eliminando evento:', err);
            alert('Error al eliminar el evento');
        }
    };

    const handleSaveEvent = async () => {
        if (!newEvent.user_id || !newEvent.startDate || !newEvent.endDate) {
            alert('Por favor, completa los campos obligatorios: Tipo, Usuario, Fecha de inicio y Fecha de fin.');
            return;
        }

        if (new Date(newEvent.startDate) > new Date(newEvent.endDate)) {
            alert('La fecha de inicio no puede ser posterior a la fecha de fin');
            return;
        }

        if ((newEvent.type === 'visitas' || newEvent.type === 'reuniones' || newEvent.type === 'guardias' || newEvent.type === 'jornada' || newEvent.type === 'ofi' || newEvent.type === 'compras' || newEvent.type === 'manuales') && newEvent.startTime && newEvent.endTime) {
            if (newEvent.startTime >= newEvent.endTime) {
                alert('La hora de inicio debe ser anterior a la hora de fin');
                return;
            }
        }

        if (newEvent.repetitionFrequency === 'everyXWeeks' && (newEvent.repetitionInterval < 1 || isNaN(newEvent.repetitionInterval))) {
            alert('El intervalo de repetición debe ser un número mayor que 0.');
            return;
        }

        if ((newEvent.repetitionFrequency === 'weekly' || newEvent.repetitionFrequency === 'everyXWeeks') &&
            (!Array.isArray(newEvent.repetitionWeekdays) || newEvent.repetitionWeekdays.length === 0)) {
            alert('Por favor selecciona al menos un día de la semana para la repetición semanal.');
            return;
        }

        try {
            const eventTypeLabel = eventTypes[newEvent.type]?.label || newEvent.type;
            const eventData = {
                title: eventTypeLabel,
                type: newEvent.type,
                user_id: newEvent.user_id,
                start_date: newEvent.startDate,
                end_date: newEvent.endDate,
                start_time: newEvent.startTime || null,
                end_time: newEvent.endTime || null,
                description: newEvent.description || '',
                repetition_frequency: newEvent.repetitionFrequency || null,
                repetition_interval: newEvent.repetitionInterval || 1,
                repetition_weekdays: newEvent.repetitionWeekdays || [],
                exceptions: newEvent.exceptions || []
            };

            console.log('Guardando evento:', eventData);

            if (editingEvent) {
                await eventsAPI.update(editingEvent.id, eventData);
            } else {
                await eventsAPI.create(eventData);
            }

            await loadEvents();
            setShowModal(false);
        } catch (err) {
            console.error('Error guardando evento:', err);
            alert('Error al guardar el evento');
        }
    };

    const handleRepetitionWeekdayToggle = (dayIndex) => {
        setNewEvent(prev => {
            const newWeekdays = prev.repetitionWeekdays.includes(dayIndex)
                ? prev.repetitionWeekdays.filter(d => d !== dayIndex)
                : [...prev.repetitionWeekdays, dayIndex];

            return { ...prev, repetitionWeekdays: newWeekdays };
        });
    };

    const handleUserFilterToggle = (user) => {
        setFilters(prev => ({
            ...prev,
            users: prev.users.includes(user)
                ? prev.users.filter(u => u !== user)
                : [...prev.users, user]
        }));
    };

    const clearAllFilters = () => {
        setFilters({
            vacaciones: true,
            guardias: true,
            visitas: true,
            reuniones: true,
            jornada: true,
            ofi: true,
            compras: true,
            manuales: true,
            users: []
        });
    };

    const exportData = () => {
        const data = {
            events: events,
            filters: filters,
            exportDate: new Date().toISOString(),
            version: '3.1'
        };

        const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `calendario-cau-v3-${new Date().toISOString().split('T')[0]}.json`;
        a.click();
        URL.revokeObjectURL(url);

        setShowExportNote(true);
        setTimeout(() => setShowExportNote(false), 5000);
    };

    const importData = (event) => {
        const file = event.target.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = (e) => {
            try {
                const data = JSON.parse(e.target.result);
                if (data.events) {
                    setEvents(data.events);
                }
                if (data.filters) {
                    setFilters(data.filters);
                }
                alert('Datos importados correctamente');
            } catch (error) {
                alert('Error al importar el archivo: ' + error.message);
            }
        };
        reader.readAsText(file);
        event.target.value = '';
    };

    const renderMonthlyView = () => {
        const days = getDaysInMonth(currentDate);

        return React.createElement('div', { className: "calendar-container" },
            React.createElement('div', { className: "calendar-header" },
                weekDays.map(day =>
                    React.createElement('div', {
                        key: day,
                        className: "day-header"
                    }, day)
                )
            ),

            React.createElement('div', { className: "calendar-grid" },
                days.map((day, index) => {
                    const dayEvents = getEventsForDate(day);
                    const isToday = day && day.toDateString() === new Date().toDateString();

                    return React.createElement('div', {
                        key: index,
                        className: `calendar-day ${!day ? 'empty' : ''} ${isToday ? 'today' : ''}`,
                        onClick: () => day && handleDayClick(day)
                    },
                        day && [
                            React.createElement('div', {
                                key: 'date',
                                className: `day-number ${isToday ? 'today' : ''}`
                            }, day.getDate()),

                            React.createElement('div', { key: 'events', className: "events-container" },
                                dayEvents.map(event =>
                                    React.createElement('div', {
                                        key: event.id,
                                        className: `event-item ${event.type}`
                                    },
                                        React.createElement('div', { className: "event-title" },
                                            `${eventTypes[event.type] ? eventTypes[event.type].code : event.type.toUpperCase()}`
                                        ),
                                        React.createElement('div', { className: "event-user" }, event.user),
                                        event.start_time && React.createElement('div', { className: "event-time" },
                                            `${event.start_time}${event.end_time ? ' - ' + event.end_time : ''}`
                                        ),

                                        React.createElement('div', { className: "event-actions" },
                                            React.createElement('button', {
                                                onClick: (e) => {
                                                    e.stopPropagation();
                                                    handleEditEvent(event);
                                                },
                                                className: "action-btn",
                                                title: "Editar"
                                            }, "E"),

                                            React.createElement('button', {
                                                onClick: (e) => {
                                                    e.stopPropagation();
                                                    handleDeleteEvent(event, day);
                                                },
                                                className: "action-btn",
                                                title: "X"
                                            }, "X")
                                        )
                                    )
                                )
                            )
                        ]
                    );
                })
            )
        );
    };

    const renderYearlyView = () => {
        const year = currentDate.getFullYear();
        const monthsData = [];

        for (let i = 0; i < 12; i++) {
            const monthDate = new Date(year, i, 1);
            const days = getDaysInMonth(monthDate);
            monthsData.push({ monthDate, days });
        }

        return React.createElement('div', { className: "year-view" },
            monthsData.map(({ days }, monthIndex) =>
                React.createElement('div', { key: monthIndex, className: "month-card" },
                    React.createElement('div', { className: "month-card-header" },
                        months[monthIndex]
                    ),
                    React.createElement('div', { className: "mini-calendar" },
                        weekDays.map(day =>
                            React.createElement('div', {
                                key: day,
                                className: "mini-day",
                                style: { fontSize: '0.6rem', fontWeight: 'bold' }
                            }, day.charAt(0))
                        ),
                        days.map((day, dayIndex) => {
                            if (!day) return React.createElement('div', { key: dayIndex, className: "mini-day" });

                            const dayEvents = getEventsForDate(day);
                            const isToday = day.toDateString() === new Date().toDateString();
                            const hasEvents = dayEvents.length > 0;
                            const hasJornada = dayEvents.some(event => event.type === 'jornada');

                            return React.createElement('div', {
                                key: dayIndex,
                                className: `mini-day ${hasEvents ? 'has-events' : ''} ${hasJornada ? 'has-jornada' : ''} ${isToday ? 'today' : ''}`,
                                onClick: () => handleDayClick(day),
                                title: hasEvents ? `${dayEvents.length} evento(s)` : ''
                            }, day.getDate());
                        })
                    )
                )
            )
        );
    };

    const renderDailyView = () => {
        const dateStr = selectedDate.toLocaleDateString('es-ES', {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });

        return React.createElement('div', {},
            React.createElement('div', {
                style: {
                    marginBottom: '1rem',
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center'
                }
            },
                React.createElement('h3', { style: { textTransform: 'capitalize' } }, dateStr),
                React.createElement('button', {
                    onClick: () => handleAddEvent(selectedDate),
                    className: "btn btn-primary"
                }, "Nuevo Evento")
            ),

            React.createElement('div', { className: "calendar-container" },
                React.createElement('div', { className: "day-view" },
                    hours.map(hour => [
                        React.createElement('div', {
                            key: `label-${hour}`,
                            className: "hour-label"
                        }, hour),
                        React.createElement('div', {
                            key: `slot-${hour}`,
                            className: "hour-slot",
                            onClick: () => handleAddEvent(selectedDate, hour)
                        },
                            getEventsForHour(selectedDate, hour).map(event =>
                                React.createElement('div', {
                                    key: event.id,
                                    className: `hour-event ${event.type}`
                                },
                                    React.createElement('div', { style: { fontWeight: 'bold' } },
                                        `${eventTypes[event.type] ? eventTypes[event.type].code : event.type.toUpperCase()}`
                                    ),
                                    React.createElement('div', {}, event.user),
                                    event.start_time && React.createElement('div', { style: { fontSize: '0.7rem' } },
                                        `${event.start_time}${event.end_time ? ' - ' + event.end_time : ''}`
                                    )
                                )
                            )
                        )
                    ])
                )
            )
        );
    };

    const renderDashboard = () => {
        const userStats = getUserStats();
        const totalStats = userStats.reduce((acc, user) => ({
            vacaciones: acc.vacaciones + user.vacaciones,
            guardias: acc.guardias + user.guardias,
            visitas: acc.visitas + user.visitas,
            reuniones: acc.reuniones + user.reuniones,
            jornada: acc.jornada + user.jornada,
            ofi: acc.ofi + user.ofi,
            compras: acc.compras + user.compras,
            manuales: acc.manuales + user.manuales
        }), { vacaciones: 0, guardias: 0, visitas: 0, reuniones: 0, jornada: 0, ofi: 0, compras: 0, manuales: 0 });

        return React.createElement('div', { className: "stats-section" },
            React.createElement('div', { className: "stats-header" },
                React.createElement('h3', { className: "stats-title" },
                    `Dashboard - Año ${currentDate.getFullYear()}`
                ),
                React.createElement('div', { style: { display: 'flex', gap: '1rem', alignItems: 'center' } },
                    React.createElement('div', { style: { fontSize: '0.875rem', color: '#6b7280' } },
                        `Total: ${totalStats.vacaciones} vac. | ${totalStats.guardias} guard. | ${totalStats.visitas} visit. | ${totalStats.reuniones} reun. | ${totalStats.jornada} jorn. | ${totalStats.ofi} ofi | ${totalStats.compras} compras | ${totalStats.manuales} manuales`
                    )
                )
            ),

            React.createElement('div', { className: "user-stats" },
                userStats.map(user =>
                    React.createElement('div', { key: user.name, className: "user-card" },
                        React.createElement('div', { className: "user-name" }, user.name),
                        React.createElement('div', { className: "stat-grid" },
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number vacaciones" }, user.vacaciones),
                                React.createElement('div', { className: "stat-label" }, "Vacaciones")
                            ),
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number guardias" }, user.guardias),
                                React.createElement('div', { className: "stat-label" }, "Guardias")
                            ),
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number visitas" }, user.visitas),
                                React.createElement('div', { className: "stat-label" }, "Visitas Médicas")
                            ),
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number reuniones" }, user.reuniones),
                                React.createElement('div', { className: "stat-label" }, "Reuniones")
                            ),
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number jornada" }, user.jornada),
                                React.createElement('div', { className: "stat-label" }, "Jornadas 18:30")
                            ),
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number ofi" }, user.ofi),
                                React.createElement('div', { className: "stat-label" }, "Ofi")
                            ),
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number compras" }, user.compras),
                                React.createElement('div', { className: "stat-label" }, "Compras")
                            ),
                            React.createElement('div', { className: "stat-item" },
                                React.createElement('div', { className: "stat-number manuales" }, user.manuales),
                                React.createElement('div', { className: "stat-label" }, "Manuales")
                            )
                        )
                    )
                )
            )
        );
    };

    const getViewTitle = () => {
        switch (currentView) {
            case 'yearly':
                return currentDate.getFullYear().toString();
            case 'daily':
                return `${months[selectedDate.getMonth()]} ${selectedDate.getFullYear()}`;
            default:
                return `${months[currentDate.getMonth()]} ${currentDate.getFullYear()}`;
        }
    };

    const handleLoginSuccess = (user) => {
        setCurrentUser(user);
        setIsAuthenticated(true);
    };

    const handleLogout = () => {
        authAPI.logout();
        setCurrentUser(null);
        setIsAuthenticated(false);
        setEvents([]);
        setUsers([]);
    };

    const handleChangePasswordSuccess = () => {
        setShowChangePassword(false);
        alert('Contraseña cambiada correctamente');
    };

    // Mostrar login si no está autenticado
    if (!isAuthenticated) {
        return React.createElement(LoginPage, { onLoginSuccess: handleLoginSuccess });
    }

    if (loading) {
        return React.createElement('div', {
            style: {
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh',
                fontSize: '1.2rem'
            }
        }, 'Cargando calendario...');
    }

    if (error) {
        return React.createElement('div', {
            style: {
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh',
                fontSize: '1.2rem',
                color: 'red'
            }
        },
            React.createElement('div', {}, error),
            React.createElement('button', {
                onClick: loadInitialData,
                style: { marginTop: '1rem', padding: '0.5rem 1rem' }
            }, 'Reintentar')
        );
    }

    return React.createElement('div', {},
        React.createElement('div', { className: "header" },
            React.createElement('div', { className: "container" },
                React.createElement('div', {
                    style: {
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'center',
                        flexWrap: 'wrap',
                        gap: '1rem'
                    }
                },
                    React.createElement('div', {},
                        React.createElement('h1', {}, "Calendario del CAU SES-SGS"),
                        React.createElement('p', {}, "Sistema de Gestión de Vacaciones, Guardias, Visitas Médicas y Reuniones")
                    ),
                    React.createElement('div', {
                        style: {
                            display: 'flex',
                            alignItems: 'center',
                            gap: '1rem'
                        }
                    },
                        React.createElement('div', {
                            style: {
                                textAlign: 'right',
                                fontSize: '0.875rem'
                            }
                        },
                            React.createElement('div', {
                                style: { fontWeight: '600' }
                            }, currentUser.name),
                            React.createElement('div', {
                                style: {
                                    color: '#bfdbfe',
                                    fontSize: '0.75rem'
                                }
                            }, currentUser.username)
                        ),
                        React.createElement('button', {
                            onClick: () => setShowChangePassword(true),
                            style: {
                                padding: '0.5rem 1rem',
                                background: 'rgba(255, 255, 255, 0.2)',
                                border: '1px solid rgba(255, 255, 255, 0.3)',
                                borderRadius: '0.375rem',
                                color: 'white',
                                fontSize: '0.875rem',
                                cursor: 'pointer',
                                transition: 'all 0.2s'
                            }
                        }, 'Cambiar contraseña'),
                        React.createElement('button', {
                            onClick: handleLogout,
                            style: {
                                padding: '0.5rem 1rem',
                                background: 'rgba(239, 68, 68, 0.8)',
                                border: '1px solid rgba(239, 68, 68, 0.9)',
                                borderRadius: '0.375rem',
                                color: 'white',
                                fontSize: '0.875rem',
                                cursor: 'pointer',
                                transition: 'all 0.2s'
                            }
                        }, 'Cerrar sesión')
                    )
                ),
                React.createElement('div', { className: "firma" },
                    "Firmado por ",
                    React.createElement('strong', {}, "Satecgroup")
                )
            )
        ),

        React.createElement('div', { className: "container main-content" },
            React.createElement('div', { className: "controls" },
                React.createElement('div', { style: { display: 'flex', alignItems: 'center', gap: '1rem' } },
                    React.createElement('div', { className: "view-tabs" },
                        React.createElement('button', {
                            onClick: () => setCurrentView('monthly'),
                            className: `view-tab ${currentView === 'monthly' ? 'active' : ''}`
                        }, "Mensual"),
                        React.createElement('button', {
                            onClick: () => setCurrentView('yearly'),
                            className: `view-tab ${currentView === 'yearly' ? 'active' : ''}`
                        }, "Anual"),
                        React.createElement('button', {
                            onClick: () => setCurrentView('daily'),
                            className: `view-tab ${currentView === 'daily' ? 'active' : ''}`
                        }, "Diario")
                    ),

                    currentView !== 'daily' && React.createElement('div', { className: "month-nav" },
                        React.createElement('button', {
                            onClick: handlePrevMonth,
                            className: "btn btn-nav"
                        }, "<"),

                        React.createElement('h2', { className: "month-title" }, getViewTitle()),

                        React.createElement('button', {
                            onClick: handleNextMonth,
                            className: "btn btn-nav"
                        }, ">")
                    )
                ),

                React.createElement('div', { className: "action-buttons" },
                    React.createElement('button', {
                        onClick: () => setShowDashboard(!showDashboard),
                        className: `dashboard-toggle ${showDashboard ? 'active' : ''}`
                    }, "Dashboard"),

                    React.createElement('button', {
                        onClick: exportData,
                        className: "btn btn-success"
                    }, "Exportar"),

                    React.createElement('label', { className: "btn btn-warning" },
                        "Importar",
                        React.createElement('input', {
                            type: "file",
                            accept: ".json",
                            onChange: importData
                        })
                    ),

                    React.createElement('button', {
                        onClick: () => setShowFilters(!showFilters),
                        className: "btn btn-secondary"
                    }, "Filtros"),

                    currentView !== 'daily' && React.createElement('button', {
                        onClick: () => handleAddEvent(),
                        className: "btn btn-primary"
                    }, "Nuevo Evento")
                )
            ),

            showExportNote && React.createElement('div', { className: "export-note" },
                React.createElement('strong', {}, "Nota: "),
                "El archivo se ha descargado en tu carpeta de descargas. Por favor, muévelo manualmente a Y:\\7-Compartido\\Calendario"
            ),

            showFilters && React.createElement('div', { className: "filters-panel" },
                React.createElement('div', { className: "filters-header" },
                    React.createElement('h3', { className: "filters-title" }, "Filtros"),
                    React.createElement('button', {
                        onClick: clearAllFilters,
                        className: "link-btn"
                    }, "Limpiar filtros")
                ),

                React.createElement('div', { className: "filters-grid" },
                    React.createElement('div', { className: "filter-section" },
                        React.createElement('h4', {}, "Tipos de Evento"),
                        React.createElement('div', { className: "filter-options" },
                            Object.entries(eventTypes).map(([key, type]) =>
                                React.createElement('label', { key: key, className: "filter-option" },
                                    React.createElement('input', {
                                        type: "checkbox",
                                        checked: filters[key] !== undefined ? filters[key] : true,
                                        onChange: (e) => setFilters(prev => ({ ...prev, [key]: e.target.checked }))
                                    }),
                                    React.createElement('div', { className: `color-indicator color-${key}` }),
                                    React.createElement('span', {}, `${type.label} (${type.code})`)
                                )
                            )
                        )
                    ),

                    React.createElement('div', { className: "filter-section" },
                        React.createElement('h4', {}, "Usuarios"),
                        React.createElement('div', { className: "filter-options" },
                            users.map(user =>
                                React.createElement('label', { key: user.id, className: "filter-option" },
                                    React.createElement('input', {
                                        type: "checkbox",
                                        checked: filters.users.includes(user.name),
                                        onChange: () => handleUserFilterToggle(user.name)
                                    }),
                                    React.createElement('span', { style: { fontSize: '0.875rem' } }, user.name)
                                )
                            )
                        )
                    )
                )
            ),

            showDashboard && renderDashboard(),

            currentView === 'monthly' && renderMonthlyView(),
            currentView === 'yearly' && renderYearlyView(),
            currentView === 'daily' && renderDailyView()
        ),

        showChangePassword && React.createElement(ChangePasswordModal, {
            user: currentUser,
            onClose: () => setShowChangePassword(false),
            onSuccess: handleChangePasswordSuccess
        }),

        showModal && React.createElement('div', { className: "modal" },
            React.createElement('div', { className: "modal-content" },
                React.createElement('div', { className: "modal-header" },
                    React.createElement('h3', { className: "modal-title" },
                        (editingEvent ? 'Editar Evento' : 'Nuevo Evento')
                    )
                ),

                React.createElement('div', { className: "modal-body" },
                    React.createElement('div', { className: "form-group" },
                        React.createElement('label', { className: "form-label" }, "Tipo *"),
                        React.createElement('select', {
                            value: newEvent.type,
                            onChange: (e) => {
                                const newType = e.target.value;
                                setNewEvent(prev => {
                                    const updated = { ...prev, type: newType };
                                    if (newType === 'jornada') {
                                        updated.title = updated.title || 'Jornada Extendida 18:30';
                                        updated.startTime = updated.startTime || '18:30';
                                        updated.endTime = updated.endTime || '19:00';
                                    }
                                    return updated;
                                });
                            },
                            className: "form-select"
                        },
                            Object.entries(eventTypes).map(([key, type]) =>
                                React.createElement('option', { key: key, value: key }, type.label)
                            )
                        )
                    ),

                    React.createElement('div', { className: "form-group" },
                        React.createElement('label', { className: "form-label" }, "Usuario *"),
                        React.createElement('select', {
                            value: newEvent.user_id,
                            onChange: (e) => setNewEvent(prev => ({ ...prev, user_id: e.target.value })),
                            className: "form-select"
                        },
                            React.createElement('option', { value: "" }, "Seleccionar usuario"),
                            users.map(user =>
                                React.createElement('option', { key: user.id, value: user.id }, user.name)
                            )
                        )
                    ),

                    React.createElement('div', { className: "form-grid" },
                        React.createElement('div', { className: "form-group" },
                            React.createElement('label', { className: "form-label" }, "Fecha Inicio *"),
                            React.createElement('input', {
                                type: "date",
                                value: newEvent.startDate,
                                onChange: (e) => setNewEvent(prev => ({ ...prev, startDate: e.target.value })),
                                className: "form-input"
                            })
                        ),

                        React.createElement('div', { className: "form-group" },
                            React.createElement('label', { className: "form-label" }, "Fecha Fin *"),
                            React.createElement('input', {
                                type: "date",
                                value: newEvent.endDate,
                                onChange: (e) => setNewEvent(prev => ({ ...prev, endDate: e.target.value })),
                                className: "form-input"
                            })
                        )
                    ),

                    (newEvent.type === 'visitas' || newEvent.type === 'reuniones' || newEvent.type === 'guardias' || newEvent.type === 'jornada' || newEvent.type === 'ofi' || newEvent.type === 'compras' || newEvent.type === 'manuales') &&
                    React.createElement('div', { className: "form-grid" },
                        React.createElement('div', { className: "form-group" },
                            React.createElement('label', { className: "form-label" }, "Hora Inicio"),
                            React.createElement('input', {
                                type: "time",
                                value: newEvent.startTime,
                                onChange: (e) => setNewEvent(prev => ({ ...prev, startTime: e.target.value })),
                                className: "form-input",
                                min: "08:00",
                                max: "20:00"
                            })
                        ),

                        React.createElement('div', { className: "form-group" },
                            React.createElement('label', { className: "form-label" }, "Hora Fin"),
                            React.createElement('input', {
                                type: "time",
                                value: newEvent.endTime,
                                onChange: (e) => setNewEvent(prev => ({ ...prev, endTime: e.target.value })),
                                className: "form-input",
                                min: "08:00",
                                max: "20:00"
                            })
                        )
                    ),

                    React.createElement('div', { className: "form-group" },
                        React.createElement('label', { className: "form-label" }, "Repetir evento"),
                        React.createElement('select', {
                            value: newEvent.repetitionFrequency,
                            onChange: (e) => setNewEvent(prev => ({ ...prev, repetitionFrequency: e.target.value })),
                            className: "form-select"
                        },
                            React.createElement('option', { value: "" }, "No repetir"),
                            React.createElement('option', { value: "daily" }, "Diariamente"),
                            React.createElement('option', { value: "weekly" }, "Semanalmente"),
                            React.createElement('option', { value: "everyXWeeks" }, "Cada X semanas")
                        )
                    ),

                    (newEvent.repetitionFrequency === 'weekly' || newEvent.repetitionFrequency === 'everyXWeeks') && React.createElement('div', { className: "form-group" },
                        React.createElement('label', { className: "form-label" }, "Repetir los días"),
                        React.createElement('div', { style: { display: 'flex', gap: '0.5rem', flexWrap: 'wrap' } },
                            weekDays.map((day, index) =>
                                React.createElement('label', { key: index, style: { display: 'flex', alignItems: 'center' } },
                                    React.createElement('input', {
                                        type: "checkbox",
                                        checked: newEvent.repetitionWeekdays.includes(index),
                                        onChange: () => handleRepetitionWeekdayToggle(index)
                                    }),
                                    React.createElement('span', { style: { marginLeft: '0.25rem' } }, day)
                                )
                            )
                        )
                    ),

                    newEvent.repetitionFrequency === 'everyXWeeks' && React.createElement('div', { className: "form-group" },
                        React.createElement('label', { className: "form-label" }, "Intervalo de repetición (en semanas)"),
                        React.createElement('input', {
                            type: "number",
                            value: newEvent.repetitionInterval,
                            onChange: (e) => setNewEvent(prev => ({ ...prev, repetitionInterval: parseInt(e.target.value) || 1 })),
                            className: "form-input",
                            min: "1"
                        })
                    ),

                    React.createElement('div', { className: "form-group" },
                        React.createElement('label', { className: "form-label" }, "Descripción"),
                        React.createElement('textarea', {
                            value: newEvent.description,
                            onChange: (e) => setNewEvent(prev => ({ ...prev, description: e.target.value })),
                            className: "form-textarea",
                            placeholder: "Descripción adicional (opcional)",
                            rows: "3"
                        })
                    ),

                    React.createElement('div', { className: "modal-actions" },
                        React.createElement('button', {
                            onClick: () => setShowModal(false),
                            className: "btn btn-secondary btn-full"
                        }, "Cancelar"),

                        React.createElement('button', {
                            onClick: handleSaveEvent,
                            className: "btn btn-primary btn-full"
                        }, editingEvent ? 'Actualizar' : 'Guardar')
                    )
                )
            )
        )
    );
};

export default CAUCalendar;