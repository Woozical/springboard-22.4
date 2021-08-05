DROP DATABASE IF EXISTS league;
CREATE DATABASE league;

\c league;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team INT REFERENCES teams(id)
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE,
    champion INT REFERENCES teams(id)
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team INT NOT NULL REFERENCES teams(id),
    away_team INT NOT NULL REFERENCES teams(id),
    season INT NOT NULL REFERENCES seasons(id),
    date DATE NOT NULL
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    match INT NOT NULL REFERENCES matches(id) ON DELETE CASCADE,
    player INT REFERENCES players(id) ON DELETE SET NULL,
    team INT NOT NULL REFERENCES teams(id)
);

CREATE TABLE ref_assigns(
    id SERIAL PRIMARY KEY,
    referee INT NOT NULL REFERENCES referees(id) ON DELETE CASCADE,
    match INT NOT NULL REFERENCES matches(id) ON DELETE CASCADE
);