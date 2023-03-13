CREATE DATABASE new_database;

CREATE SCHEMA main;
CREATE SCHEMA spotify;
CREATE SCHEMA apple;

SET search_path TO pg_catalog,public,main,spotify,apple;

CREATE TABLE main.artist (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name text,
	"spoID" char(22),
	"aplID" integer,
	"amzID" text,
	CONSTRAINT artist_pk PRIMARY KEY (id)
);

CREATE TABLE main.album (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"spoID" char(22),
	"aplID" integer,
	"amzID" text,
	upc char(12),
	ean char(13),
	"isSingle" boolean,
	"isCompilation" boolean,
	name text,
	label text,
	"totalTracks" smallint,
	"releaseDate" date,
	CONSTRAINT album_pk PRIMARY KEY (id)
);

CREATE TABLE main.track (
	id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	isrc char(12),
	name text,
	"trackNumber" smallint,
	"discNumber" smallint,
	CONSTRAINT track_pk PRIMARY KEY (id)
);