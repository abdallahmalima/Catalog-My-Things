CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
)

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
	publish_date DATE NOT NULL,
	archived BOOLEAN NOT NULL,
	on_spotify BOOLEAN NOT NULL,
	genre_ID INT REFERENCES Genre(ID)
)

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL
	last_name VARCHAR(100) NOT NULL
)

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
	publish_date DATE NOT NULL,
	archived BOOLEAN NOT NULL,
	multiplayer BOOLEAN NOT NULL,
	last_played DATE NOT NULL
	author_id INT REFERENCES Author(ID)
)

CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL
	color VARCHAR(100) NOT NULL
)

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
	publish_date DATE NOT NULL,
	archived BOOLEAN NOT NULL,
	publisher VARCHAR(100) NOT NULL,
	cover_state VARCHAR(100) NOT NULL,
	label_id INT REFERENCES labels(ID)
)