-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around INT NOT NULL REFERENCES galaxies(id)
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT NOT NULL REFERENCES stars(id),
  galaxy INT NOT NULL REFERENCES galaxies(id)
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around INT NOT NULL REFERENCES planets(id),
  galaxy INT NOT NULL REFERENCES galaxies(id)
);

INSERT INTO galaxies (name) VALUES ('Milky Way');

INSERT INTO stars (name, orbits_around)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO moons
  (name, orbits_around, galaxy)
VALUES
  ('The Moon', 1, 1),
  ('Phobos', 2, 1), ('Deimos', 2, 1),
  ('Naiad', 4, 1),
  ('Thalassa', 4, 1),
  ('Despina', 4, 1),
  ('Galatea', 4, 1),
  ('Larissa', 4, 1),
  ('S/2004 N 1', 4, 1),
  ('Proteus', 4, 1),
  ('Triton', 4, 1),
  ('Nereid', 4, 1),
  ('Halimede', 4, 1),
  ('Sao', 4, 1),
  ('Laomedeia', 4, 1),
  ('Psamathe', 4, 1),
  ('Neso', 4, 1);