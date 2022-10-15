-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors { id serial PRIMARY KEY,
first_name text NOT NULL,
last_name text NOT NULL,
specialty text };

CREATE TABLE patients { id serial PRIMARY KEY,
first_name text NOT NULL,
last_name text NOT NULL,
medical_history boolean };

CREATE TABLE diseases { id serial PRIMARY KEY,
name text NOT NULL,
curable boolean,
treatable boolean };

CREATE TABLE visits { id serial PRIMARY KEY,
doctor_id integer NOT NULL REFERENCES doctors ON DELETE CASCADE,
patient_id integer NOT NULL REFERENCES patients ON DELETE CASCADE,
has_disease boolean DEFAULT FALSE,
prognosis text NOT NULL };

CREATE TABLE diagnosis { id serial PRIMARY KEY,
visit_id integer NOT NULL REFERENCES visits ON DELETE CASCADE,
disease_id integer NOT NULL REFERENCES diseases ON DELETE CASCADE };

