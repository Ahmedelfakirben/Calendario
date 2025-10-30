import React, { useState } from 'react';
import { authAPI } from '../supabase.js';

const ChangePasswordModal = ({ user, onClose, onSuccess }) => {
    const [currentPassword, setCurrentPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);

    const validatePassword = (password) => {
        if (password.length < 8) {
            return 'La contraseña debe tener al menos 8 caracteres';
        }
        if (!/[A-Z]/.test(password)) {
            return 'La contraseña debe contener al menos una mayúscula';
        }
        if (!/[a-z]/.test(password)) {
            return 'La contraseña debe contener al menos una minúscula';
        }
        if (!/[0-9]/.test(password)) {
            return 'La contraseña debe contener al menos un número';
        }
        if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
            return 'La contraseña debe contener al menos un carácter especial';
        }
        return null;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');

        // Validaciones
        if (newPassword !== confirmPassword) {
            setError('Las contraseñas nuevas no coinciden');
            return;
        }

        const passwordError = validatePassword(newPassword);
        if (passwordError) {
            setError(passwordError);
            return;
        }

        if (currentPassword === newPassword) {
            setError('La nueva contraseña debe ser diferente a la actual');
            return;
        }

        setLoading(true);

        try {
            await authAPI.changePassword(user.id, currentPassword, newPassword);
            onSuccess();
        } catch (err) {
            console.error('Error al cambiar contraseña:', err);
            setError(err.message || 'Error al cambiar la contraseña');
        } finally {
            setLoading(false);
        }
    };

    return React.createElement('div', {
        className: 'modal',
        onClick: onClose
    },
        React.createElement('div', {
            className: 'modal-content',
            onClick: (e) => e.stopPropagation(),
            style: { maxWidth: '500px' }
        },
            React.createElement('div', { className: 'modal-header' },
                React.createElement('h3', { className: 'modal-title' }, 'Cambiar Contraseña'),
                React.createElement('p', {
                    style: {
                        fontSize: '0.875rem',
                        color: '#6b7280',
                        marginTop: '0.5rem'
                    }
                }, `Usuario: ${user.name}`)
            ),

            React.createElement('form', {
                onSubmit: handleSubmit,
                className: 'modal-body'
            },
                React.createElement('div', { className: 'form-group' },
                    React.createElement('label', { className: 'form-label' }, 'Contraseña actual *'),
                    React.createElement('input', {
                        type: 'password',
                        value: currentPassword,
                        onChange: (e) => setCurrentPassword(e.target.value),
                        required: true,
                        disabled: loading,
                        className: 'form-input',
                        placeholder: 'Escribe tu contraseña actual'
                    })
                ),

                React.createElement('div', { className: 'form-group' },
                    React.createElement('label', { className: 'form-label' }, 'Nueva contraseña *'),
                    React.createElement('input', {
                        type: 'password',
                        value: newPassword,
                        onChange: (e) => setNewPassword(e.target.value),
                        required: true,
                        disabled: loading,
                        className: 'form-input',
                        placeholder: 'Escribe tu nueva contraseña'
                    })
                ),

                React.createElement('div', { className: 'form-group' },
                    React.createElement('label', { className: 'form-label' }, 'Confirmar nueva contraseña *'),
                    React.createElement('input', {
                        type: 'password',
                        value: confirmPassword,
                        onChange: (e) => setConfirmPassword(e.target.value),
                        required: true,
                        disabled: loading,
                        className: 'form-input',
                        placeholder: 'Confirma tu nueva contraseña'
                    })
                ),

                React.createElement('div', {
                    style: {
                        padding: '0.75rem',
                        background: '#f3f4f6',
                        borderRadius: '0.5rem',
                        fontSize: '0.75rem',
                        color: '#6b7280',
                        marginBottom: '1rem'
                    }
                },
                    React.createElement('p', {
                        style: { fontWeight: '600', marginBottom: '0.5rem' }
                    }, 'Requisitos de contraseña:'),
                    React.createElement('ul', {
                        style: {
                            paddingLeft: '1.5rem',
                            margin: 0
                        }
                    },
                        React.createElement('li', {}, 'Mínimo 8 caracteres'),
                        React.createElement('li', {}, 'Al menos una letra mayúscula'),
                        React.createElement('li', {}, 'Al menos una letra minúscula'),
                        React.createElement('li', {}, 'Al menos un número'),
                        React.createElement('li', {}, 'Al menos un carácter especial (!@#$%^&*...)')
                    )
                ),

                error && React.createElement('div', {
                    style: {
                        padding: '0.75rem',
                        background: '#fee2e2',
                        border: '1px solid #ef4444',
                        borderRadius: '0.5rem',
                        color: '#991b1b',
                        fontSize: '0.875rem',
                        marginBottom: '1rem'
                    }
                }, error),

                React.createElement('div', { className: 'modal-actions' },
                    React.createElement('button', {
                        type: 'button',
                        onClick: onClose,
                        disabled: loading,
                        className: 'btn btn-secondary btn-full'
                    }, 'Cancelar'),

                    React.createElement('button', {
                        type: 'submit',
                        disabled: loading,
                        className: 'btn btn-primary btn-full'
                    }, loading ? 'Cambiando...' : 'Cambiar contraseña')
                )
            )
        )
    );
};

export default ChangePasswordModal;
