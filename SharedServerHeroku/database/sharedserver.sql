\l;
DROP DATABASE IF EXISTS sharedserver;
CREATE DATABASE sharedserver;

\c sharedserver;

CREATE TABLE category(
	category_name VARCHAR PRIMARY KEY NOT NULL,
	category_description VARCHAR
);

CREATE TABLE skill(
	skill_description VARCHAR,
	skill_name VARCHAR NOT NULL,
	category_name VARCHAR NOT NULL,
	FOREIGN KEY (category_name) references category(category_name),
	PRIMARY KEY (skill_name,category_name) 
);


CREATE TABLE job_position (
  jobposition_name VARCHAR NOT NULL,
  jobposition_description VARCHAR,
  category_name VARCHAR NOT NULL,
  FOREIGN KEY (category_name) references category(category_name),
  PRIMARY KEY (jobposition_name,category_name)
);

INSERT INTO category (category_name,category_description)
VALUES('software','Desarrollo de software');

INSERT INTO category (category_name,category_description)
VALUES('musica','Composicion de musica');

INSERT INTO category (category_name,category_description)
VALUES('pintura','Composicion de obras de arte');

INSERT INTO job_position (jobposition_name, jobposition_description, category_name)
VALUES ('developer front end', 'Desarrollador','software');
 
INSERT INTO job_position (jobposition_name, jobposition_description, category_name)
VALUES ('project manager', 'Persona encargada de manejar un proyecto','software');

INSERT INTO job_position (jobposition_name, jobposition_description, category_name)
VALUES ('dj', 'Persona que selecciona y mezcla música','musica');

INSERT INTO skill (skill_name,skill_description,category_name)
VALUES('c','Programacion en C','software');

INSERT INTO skill (skill_name,skill_description,category_name)
VALUES('c++','Programacion en C++','software');

INSERT INTO skill (skill_name,skill_description,category_name)
VALUES('java','Programacion en java','software');

INSERT INTO skill (skill_name,skill_description,category_name)
VALUES('guitarra','Manejo de guitarra','musica');

INSERT INTO skill (skill_name,skill_description,category_name)
VALUES('pincel','pintar con temperas','pintura');

CREATE USER sharedserveruser with password 'shared';

--SELECT * FROM PG_USER;

ALTER DATABASE sharedserver owner to sharedserveruser;

ALTER ROLE sharedserveruser WITH SUPERUSER;
