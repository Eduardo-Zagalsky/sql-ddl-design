-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams { id serial PRIMARY KEY,
team_name text NOT NULL,
player_id integer REFERENCES players ON DELETE CASCADE,
budget integer };

CREATE TABLE goals { id serial PRIMARY KEY,
player_id integer REFERENCES players ON DELETE CASCADE,
team_id integer REFERENCES teams ON DELETE CASCADE,
distance integer };

CREATE TABLE players { id serial PRIMARY KEY,
first_name text NOT NULL,
last_name text NOT NULL,
num integer NOT NULL,
age integer };

CREATE TABLE referees { id serial PRIMARY KEY,
first_name text NOT NULL,
last_name text NOT NULL };

CREATE TABLE dates { game_date date NOT NULL,
match_id integer REFERENCES MATCH ON DELETE CASCADE,
};

CREATE TABLE matches { id serial PRIMARY KEY,
home_team text REFERENCES teams ON DELETE CASCADE,
away_team text REFERENCES teams ON DELETE CASCADE,
winner text,
loser text };

