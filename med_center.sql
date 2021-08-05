DROP DATABASE IF EXISTS med_center;
CREATE DATABASE med_center;

\c med_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    degree VARCHAR(3),
    salary FLOAT NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL DEFAULT 'J.',
    last_name TEXT NOT NULL DEFAULT 'Doe',
    primary_physician INT REFERENCES doctors(id) ON DELETE SET NULL,
    last_visit DATE
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    doctor INT NOT NULL REFERENCES doctors(id) ON DELETE SET NULL,
    patient INT NOT NULL REFERENCES patients(id) ON DELETE SET NULL,
    date DATE NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    patient INT NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
    disease INT NOT NULL REFERENCES diseases(id) ON DELETE CASCADE,
    appointment INT REFERENCES appointments(id)
);