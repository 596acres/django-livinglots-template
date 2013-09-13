requirejs.config({
    baseUrl: '/static/js',
    paths: {
        'django': 'djangojs/django'
    },
    shim: {
        'django': {
            'deps': ['jquery'],
            'exports': 'Django'
        }
    },
});

// Load the main app module to start the app
requirejs(['main']);
