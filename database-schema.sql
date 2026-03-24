-- Supabase SQL schema for Dinangdangan

-- Table for barangay_officials
CREATE TABLE barangay_officials (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    term_start DATE NOT NULL,
    term_end DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO barangay_officials (name, position, term_start, term_end) VALUES
('Juan Dela Cruz', 'Captain', '2022-01-01', '2025-12-31'),
('Maria Clara', 'Councilor', '2022-01-01', '2025-12-31');

-- Table for purok_officials
CREATE TABLE purok_officials (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    purok_number INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO purok_officials (name, purok_number) VALUES
('Pedro Santos', 1),
('Liza Rodriguez', 2);

-- Table for residents
CREATE TABLE residents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    address VARCHAR(255),
    barangay_official_id INTEGER REFERENCES barangay_officials(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO residents (name, birth_date, address, barangay_official_id) VALUES
('Juanita Reyes', '1990-05-10', 'Purok 1, Dinangdangan', 1),
('Carlos Ramos', '1985-07-15', 'Purok 2, Dinangdangan', 2);

-- Table for bulletins
CREATE TABLE bulletins (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO bulletins (title, content) VALUES
('Barangay Meeting', 'Scheduled meeting for all barangay residents.'),
('Health Awareness', 'Free medical check-up this weekend.');

-- Table for gallery
CREATE TABLE gallery (
    id SERIAL PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO gallery (image_url, description) VALUES
('http://example.com/image1.jpg', 'Barangay Fiesta 2023'),
('http://example.com/image2.jpg', 'Tree Planting Activity');

-- Table for emergency_contacts
CREATE TABLE emergency_contacts (
    id SERIAL PRIMARY KEY,
    contact_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO emergency_contacts (contact_name, contact_number) VALUES
('Police Station', '123-456-7890'),
('Fire Department', '098-765-4321');

-- Indexes
CREATE INDEX idx_barangay_officials_name ON barangay_officials(name);
CREATE INDEX idx_residents_name ON residents(name);
CREATE INDEX idx_bulletins_title ON bulletins(title);