DROP DATABASE IF EXISTS confidentials;
CREATE DATABASE confidentials;

\c confidentials;

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE subcategories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    parent_category INT NOT NULL REFERENCES categories(id)
);

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE locales(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    parent_region INT NOT NULL REFERENCES regions(id)
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT,
    preferred_region INT REFERENCES regions(id) ON DELETE SET NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    category INT NOT NULL REFERENCES subcategories(id) ON DELETE SET NULL,
    location INT NOT NULL REFERENCES locales(id) ON DELETE SET NULL,
    posted_by INT NOT NULL REFERENCES users(id) ON DELETE CASCADE
);