CREATE TABLE Genre (
    id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
)

CREATE TABLE MusicAlbum (
    id SERIAL PRIMARY KEY,
	publish_date DATE NOT NULL,
	archived BOOLEAN NOT NULL,
	on_spotify BOOLEAN NOT NULL,
	genre_ID INT REFERENCES Genre(ID)
)

CREATE TABLE Author (
    id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL
	last_name VARCHAR(100) NOT NULL
)

CREATE TABLE Game (
    id SERIAL PRIMARY KEY,
	publish_date DATE NOT NULL,
	archived BOOLEAN NOT NULL,
	multiplayer BOOLEAN NOT NULL,
	last_played DATE NOT NULL
	author_id INT REFERENCES Author(ID)
)