\l;
DROP DATABASE IF EXISTS sharedserver;
CREATE DATABASE sharedserver;

\c sharedserver;

CREATE TABLE category(
	name VARCHAR PRIMARY KEY NOT NULL,
	description VARCHAR
);

CREATE TABLE skill(
	description VARCHAR,
	name VARCHAR NOT NULL,
	category VARCHAR NOT NULL,
	FOREIGN KEY (category) references category(name),
	PRIMARY KEY (name,category) 
);


CREATE TABLE job_position (
  name VARCHAR NOT NULL,
  description VARCHAR,
  category VARCHAR NOT NULL,
  FOREIGN KEY (category) references category(name),
  PRIMARY KEY (name,category)
);

INSERT INTO category (name,description)
VALUES('software','Desarrollo de software');

INSERT INTO category (name,description)
VALUES('musica','Composicion de musica');

INSERT INTO category (name,description)
VALUES('pintura','Composicion de obras de arte');

INSERT INTO job_position (name, description, category)
VALUES ('developer front end', 'Desarrollador','software');
 
INSERT INTO job_position (name, description, category)
VALUES ('project manager', 'Persona encargada de manejar un proyecto','software');

INSERT INTO job_position (name, description, category)
VALUES ('dj', 'Persona que selecciona y mezcla música','musica');

INSERT INTO skill (name,description,category)
VALUES('c','Programacion en C','software');

INSERT INTO skill (name,description,category)
VALUES('c++','Programacion en C++','software');

INSERT INTO skill (name,description,category)
VALUES('java','Programacion en java','software');

INSERT INTO skill (name,description,category)
VALUES('guitarra','Manejo de guitarra','musica');

INSERT INTO skill (name,description,category)
VALUES('pincel','pintar con temperas','pintura');

CREATE USER sharedserveruser with password 'shared';

--SELECT * FROM PG_USER;

ALTER DATABASE sharedserver owner to sharedserveruser;

ALTER ROLE sharedserveruser WITH SUPERUSER;
