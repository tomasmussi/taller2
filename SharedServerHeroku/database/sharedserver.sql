DROP DATABASE IF EXISTS sharedserver;
CREATE DATABASE sharedserver;

\c sharedserver;

CREATE TABLE job_positions (
  ID SERIAL PRIMARY KEY,
  name VARCHAR,
  description VARCHAR,
  category VARCHAR
);

INSERT INTO job_positions (name, description, category)
  VALUES ('developer', 'a software developer','software');

CREATE USER sharedserveruser with password 'shared';

SELECT * FROM PG_USER;

ALTER DATABASE sharedserver owner to sharedserveruser;

ALTER ROLE sharedserveruser WITH SUPERUSER;
