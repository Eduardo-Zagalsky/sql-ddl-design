-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users { id serial PRIMARY KEY,
username text NOT NULL,
prefered_region text NOT NULL REFERENCES locations ON DELETE CASCADE };

CREATE TABLE locations { id serial PRIMARY KEY,
place text NOT NULL };

CREATE TABLE categories { id serial PRIMARY KEY,
category text NOT NULL };

CREATE TABLE posts { id serial PRIMARY KEY,
title text NOT NULL,
describe text NOT NULL,
user_id integer NOT NULL REFERENCES users ON DELETE CASCADE,
location_id integer NOT NULL REFERENCES locations ON DELETE CASCADE,
category_id integer NOT NULL REFERENCES categories ON DELETE CASCADE };

