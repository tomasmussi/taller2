DROP DATABASE IF EXISTS sharedserver;
CREATE DATABASE sharedserver;

\c sharedserver;

CREATE TABLE job_positions (
  ID SERIAL PRIMARY KEY,
  name VARCHAR,
  category VARCHAR,  
  description VARCHAR
);

INSERT INTO job_positions (name, category, description)
  VALUES ('developer', 'software','Desarrollador');
INSERT INTO job_positions (name, description, category)
  VALUES ('project manager', 'software','Persona encargada de manejar el proyecto');
INSERT INTO job_positions (name, description, category)
  VALUES ('dj', 'music','Persona que selecciona y mezcla música');

CREATE USER sharedserveruser with password 'shared';

SELECT * FROM PG_USER;

ALTER DATABASE sharedserver owner to sharedserveruser;

ALTER ROLE sharedserveruser WITH SUPERUSER;
