-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT REFERENCES albums(id) ON DELETE SET NULL
);

CREATE TABLE works
(
  id SERIAL PRIMARY KEY,
  artist_id INT NOT NULL REFERENCES artists(id) ON DELETE CASCADE,
  song_id INT NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  album_id INT REFERENCES albums(id) ON DELETE SET NULL
);

CREATE TABLE productions
(
  id SERIAL PRIMARY KEY,
  producer_id INT NOT NULL REFERENCES producers(id) ON DELETE CASCADE,
  song_id INT REFERENCES songs(id) ON DELETE SET NULL,
  album_id INT REFERENCES albums(id) ON DELETE SET NULL
);

INSERT INTO artists
  (name)
VALUES
  ('Hanson'), ('Queen'), ('Mariah Carey'), ('Boyz II Men'),
  ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'),
  ('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'),
  ('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO albums
  (title, release_date)
VALUES
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night at the Opera', '10-31-1975'),
  ('Daydream', '11-14-1995'),
  ('A Star Is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint 3', '10-20-2009'),
  ('Prism', '12-17-2013'),
  ('Hands All Over', '06-21-2011'),
  ('Let Go', '05-14-2002'),
  ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2),
  ('One Sweet Day', 282, '11-14-1995', 3),
  ('Shallow', 216, '09-27-2018', 4),
  ('How You Remind Me', 223, '08-21-2001', 5),
  ('New York State of Mind', 276, '10-20-2009', 6),
  ('Dark Horse', 215, '12-17-2013', 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8),
  ('Complicated', 244, '05-14-2002', 9),
  ('Say My Name', 240, '11-07-1999', 10);

INSERT INTO works
  (artist_id, song_id, album_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 3, 3),
  (5, 4, 4),
  (6, 4, 4),
  (7, 5, 5),
  (8, 6, 6),
  (9, 6, 6),
  (10, 7, 7),
  (11, 7, 7),
  (12, 8, 8),
  (13, 8, 8),
  (14, 9, 9),
  (15, 10, 10);

INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'), ('Walter Afanasieff'),
  ('Benjamin Rice'), ('Rick Parashar'), ('Al Shux'), ('Max Martin'),
  ('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'),
  ('Darkchild');

INSERT INTO productions
  (producer_id, song_id, album_id)
VALUES
  (1, 1, 1),
  (2, 1, 1),
  (3, 2, 2),
  (4, 3, 3),
  (5, 4, 4),
  (6, 5, 5),
  (7, 6, 6),
  (8, 7, 7),
  (9, 7, 7),
  (10, 8, 8),
  (11, 8, 8),
  (12, 9, 9),
  (13, 10, 10);
-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
