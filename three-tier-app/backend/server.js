const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 3000;

// Database configuration (will be set via environment variables)
const pool = new Pool({
    user: process.env.DB_USER || 'myuser',
    host: process.env.DB_HOST || 'database-service',
    database: process.env.DB_NAME || 'myapp',
    password: process.env.DB_PASSWORD || 'mypassword',
    port: process.env.DB_PORT || 5432,
});

app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
    res.json({ 
        status: 'OK', 
        message: 'Backend is running',
        timestamp: new Date().toISOString()
    });
});

// Get all users (will connect to database later)
app.get('/users', async (req, res) => {
    try {
        // For now, return mock data until database is connected
        const mockUsers = [
            { id: 1, name: 'Anisha', email: 'anisha@email.com' },
            { id: 2, name: 'John Doe', email: 'john@email.com' },
            { id: 3, name: 'Jane Smith', email: 'jane@email.com' }
        ];
        res.json(mockUsers);
    } catch (err) {
        console.error('Error:', err);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// Test endpoint
app.get('/test', (req, res) => {
    res.json({ message: 'Backend API is working!' });
});

app.listen(port, () => {
    console.log(`Backend server running on port ${port}`);
    console.log('Health check: http://localhost:3000/health');
});
