CREATE DATABASE new_database;

CREATE SCHEMA main;
CREATE SCHEMA spotify;
CREATE SCHEMA apple;

SET search_path TO pg_catalog,public,main,spotify,apple;

CREATE TABLE main.artist (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name text,
	"spotify_id" char(22),
	"apple_id" integer,
	"amazon_id" text,
	CONSTRAINT artist_pk PRIMARY KEY (id)
);

CREATE TABLE main.album (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"spotify_id" char(22),
	"apple_id" integer,
	"amazon_id" text,
	upc char(12),
	ean char(13),
	"is_single" boolean,
	"is_compilation" boolean,
	name text,
	label text,
	"total_tracks" smallint,
	"release_date" date,
	CONSTRAINT album_pk PRIMARY KEY (id)
);

CREATE TABLE main.track (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	isrc char(12),
	name text,
	"track_number" smallint,
	"disc_number" smallint,
	CONSTRAINT track_pk PRIMARY KEY (id)
);

CREATE TABLE main.track_album (
	track_id bigint NOT NULL,
	album_id integer NOT NULL,
	CONSTRAINT track_fk FOREIGN KEY (track_id),
	CONSTRAINT album_fk FOREIGN KEY (album_id)
);

CREATE TABLE main.track_artist (
	track_id bigint NOT NULL,
	artist_id integer NOT NULL,
	CONSTRAINT track_fk FOREIGN KEY (track_id),
	CONSTRAINT artist_fk FOREIGN KEY (artist_id)
);
