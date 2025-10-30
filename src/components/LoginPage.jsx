import React, { useState } from 'react';
import { authAPI } from '../supabase.js';

const LoginPage = ({ onLoginSuccess }) => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        setLoading(true);

        try {
            const user = await authAPI.login(username, password);
            authAPI.saveSession(user);
            onLoginSuccess(user);
        } catch (err) {
            console.error('Error al iniciar sesión:', err);
            setError(err.message === 'Contraseña incorrecta'
                ? 'Usuario o contraseña incorrectos'
                : 'Error al iniciar sesión. Verifica tu conexión.');
        } finally {
            setLoading(false);
        }
    };

    return React.createElement('div', {
        style: {
            minHeight: '100vh',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            background: 'linear-gradient(to right, #2563eb, #1d4ed8)',
            padding: '1rem'
        }
    },
        React.createElement('div', {
            style: {
                background: 'white',
                borderRadius: '0.5rem',
                boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.1)',
                padding: '2rem',
                width: '100%',
                maxWidth: '400px'
            }
        },
            React.createElement('div', {
                style: {
                    textAlign: 'center',
                    marginBottom: '2rem'
                }
            },
                React.createElement('h1', {
                    style: {
                        fontSize: '1.875rem',
                        fontWeight: 'bold',
                        color: '#1f2937',
                        marginBottom: '0.5rem'
                    }
                }, 'Calendario CAU SES-SGS'),
                React.createElement('p', {
                    style: {
                        color: '#6b7280',
                        fontSize: '0.875rem'
                    }
                }, 'Inicia sesión para continuar')
            ),

            React.createElement('form', {
                onSubmit: handleSubmit,
                style: {
                    display: 'flex',
                    flexDirection: 'column',
                    gap: '1.5rem'
                }
            },
                React.createElement('div', {},
                    React.createElement('label', {
                        style: {
                            display: 'block',
                            fontSize: '0.875rem',
                            fontWeight: '500',
                            color: '#374151',
                            marginBottom: '0.5rem'
                        }
                    }, 'Nombre de usuario'),
                    React.createElement('input', {
                        type: 'text',
                        value: username,
                        onChange: (e) => setUsername(e.target.value),
                        required: true,
                        autoFocus: true,
                        disabled: loading,
                        style: {
                            width: '100%',
                            padding: '0.75rem',
                            border: '1px solid #d1d5db',
                            borderRadius: '0.5rem',
                            fontSize: '0.875rem'
                        },
                        placeholder: 'Escribe tu nombre de usuario'
                    })
                ),

                React.createElement('div', {},
                    React.createElement('label', {
                        style: {
                            display: 'block',
                            fontSize: '0.875rem',
                            fontWeight: '500',
                            color: '#374151',
                            marginBottom: '0.5rem'
                        }
                    }, 'Contraseña'),
                    React.createElement('input', {
                        type: 'password',
                        value: password,
                        onChange: (e) => setPassword(e.target.value),
                        required: true,
                        disabled: loading,
                        style: {
                            width: '100%',
                            padding: '0.75rem',
                            border: '1px solid #d1d5db',
                            borderRadius: '0.5rem',
                            fontSize: '0.875rem'
                        },
                        placeholder: 'Escribe tu contraseña'
                    })
                ),

                error && React.createElement('div', {
                    style: {
                        padding: '0.75rem',
                        background: '#fee2e2',
                        border: '1px solid #ef4444',
                        borderRadius: '0.5rem',
                        color: '#991b1b',
                        fontSize: '0.875rem'
                    }
                }, error),

                React.createElement('button', {
                    type: 'submit',
                    disabled: loading,
                    style: {
                        width: '100%',
                        padding: '0.75rem',
                        background: loading ? '#9ca3af' : '#2563eb',
                        color: 'white',
                        border: 'none',
                        borderRadius: '0.5rem',
                        fontSize: '1rem',
                        fontWeight: '500',
                        cursor: loading ? 'not-allowed' : 'pointer',
                        transition: 'all 0.2s'
                    }
                }, loading ? 'Iniciando sesión...' : 'Iniciar sesión')
            ),

            React.createElement('div', {
                style: {
                    marginTop: '1.5rem',
                    padding: '1rem',
                    background: '#f3f4f6',
                    borderRadius: '0.5rem',
                    fontSize: '0.75rem',
                    color: '#6b7280'
                }
            },
                React.createElement('p', {
                    style: { marginBottom: '0.5rem', fontWeight: '600' }
                }, 'Información de acceso:'),
                React.createElement('p', {}, 'Contraseña por defecto: Satec2016C@U'),
                React.createElement('p', { style: { marginTop: '0.25rem' } },
                    'Cambia tu contraseña después de iniciar sesión')
            )
        )
    );
};

export default LoginPage;
