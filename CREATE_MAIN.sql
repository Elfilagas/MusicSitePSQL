CREATE TABLE IF NOT EXISTS genres(
	genre_id serial PRIMARY KEY,
	genre_name varchar (60) UNIQUE
);

CREATE TABLE IF NOT EXISTS artists(
	artist_id serial PRIMARY KEY, 
	artist_name varchar(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS genre_artist(
	genre_id integer REFERENCES genres(genre_id),
	artist_id integer REFERENCES artists(artist_id),
	PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS albums(
	album_id serial PRIMARY KEY,
	album_name varchar(100),
	release_year integer CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS artist_album(
	artist_id integer REFERENCES artists(artist_id),
	album_id integer REFERENCES albums(album_id),
	PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS tracks(
	track_id serial PRIMARY KEY,
	album_id integer REFERENCES albums(album_id),
	track_name varchar(100),
	duration integer CHECK (duration > 0)
);

CREATE TABLE IF NOT EXISTS collections(
	collection_id serial PRIMARY KEY,
	collection_name varchar(100),
	release_year integer CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS track_collection(
	track_id integer REFERENCES tracks(track_id),
	collection_id integer references collections(collection_id),
	PRIMARY KEY (track_id, collection_id)
);
