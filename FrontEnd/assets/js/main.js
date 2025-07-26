// Global Configuration
const API_BASE_URL = 'http://localhost:8080/api';

// Authentication utilities
const auth = {
    // Get token from localStorage
    getToken() {
        return localStorage.getItem('medicare_token');
    },

    // Set token in localStorage
    setToken(token, userType, userData) {
        localStorage.setItem('medicare_token', token);
        localStorage.setItem('medicare_user_type', userType);
        localStorage.setItem('medicare_user_data', JSON.stringify(userData));
    },

    // Remove token from localStorage
    removeToken() {
        localStorage.removeItem('medicare_token');
        localStorage.removeItem('medicare_user_type');
        localStorage.removeItem('medicare_user_data');
    },

    // Check if user is logged in
    isLoggedIn() {
        return this.getToken() !== null;
    },

    // Get user type (patient, doctor, admin)
    getUserType() {
        return localStorage.getItem('medicare_user_type');
    },

    // Get user data
    getUserData() {
        const userData = localStorage.getItem('medicare_user_data');
        return userData ? JSON.parse(userData) : null;
    }
};

// API utilities
const api = {
    // Make API request with authentication
    async request(url, options = {}) {
        const token = auth.getToken();

        const defaultOptions = {
            headers: {
                'Content-Type': 'application/json',
                ...(token && { 'Authorization': `Bearer ${token}` })
            }
        };

        const config = {
            ...defaultOptions,
            ...options,
            headers: {
                ...defaultOptions.headers,
                ...options.headers
            }
        };

        try {
            const response = await fetch(`${API_BASE_URL}${url}`, config);

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            return await response.json();
        } catch (error) {
            console.error('API Error:', error);
            throw error;
        }
    },

    // GET request
    get(url) {
        return this.request(url);
    },

    // POST request
    post(url, data) {
        return this.request(url, {
            method: 'POST',
            body: JSON.stringify(data)
        });
    },

    // PUT request
    put(url, data) {
        return this.request(url, {
            method: 'PUT',
            body: JSON.stringify(data)
        });
    },

    // DELETE request
    delete(url) {
        return this.request(url, {
            method: 'DELETE'
        });
    }
};

// Utility functions
const utils = {
    // Format date
    formatDate(date) {
        return new Date(date).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    },

    // Format time
    formatTime(time) {
        return new Date(`2000-01-01T${time}`).toLocaleTimeString('en-US', {
            hour: '2-digit',
            minute: '2-digit'
        });
    },

    // Show success message
    showSuccess(message) {
        // You can implement toast notifications here
        alert('Success: ' + message);
    },

    // Show error message
    showError(message) {
        // You can implement toast notifications here
        alert('Error: ' + message);
    },

    // Redirect based on user type
    redirectToDashboard() {
        const userType = auth.getUserType();

        switch (userType) {
            case 'patient':
                window.location.href = 'pages/patient/dashboard.html';
                break;
            case 'doctor':
                window.location.href = 'pages/doctor/dashboard.html';
                break;
            case 'admin':
                window.location.href = 'pages/admin/dashboard.html';
                break;
            default:
                window.location.href = 'pages/auth/login.html';
        }
    }
};

// Initialize app
document.addEventListener('DOMContentLoaded', function() {
    console.log('MediCare+ Frontend Initialized');

    // Check authentication on protected pages
    const protectedPages = ['/patient/', '/doctor/', '/admin/'];
    const currentPath = window.location.pathname;

    if (protectedPages.some(path => currentPath.includes(path))) {
        if (!auth.isLoggedIn()) {
            window.location.href = '/pages/auth/login.html';
        }
    }
});