CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES
('Anisha', 'anisha@email.com'),
('John Doe', 'john.doe@email.com'),
('Jane Smith', 'jane.smith@email.com');
