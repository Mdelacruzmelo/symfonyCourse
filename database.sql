CREATE DATABASE IF NOT EXISTS symfony_master;
USE symfony_master;

CREATE TABLE IF NOT EXISTS users(
id											int(255) auto_increment not null,
role									varchar(50),
name									varchar(100),
surname						varchar(200),
email								varchar(255),
password					varchar(255),
created_at			datetime,
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDB;

INSERT INTO users VALUES(NULL, 'ROLE_USER', 'Victor', 'Robles', 'victor@victor.com','pasword',CURTIME());
INSERT INTO users VALUES(NULL, 'ROLE_USER', 'Mario', 'Delacruzmelo', 'mdelacruzmelo@gmail.com','pasword',CURTIME());
INSERT INTO users VALUES(NULL, 'ROLE_USER', 'Mateo', 'Martinez', 'mateodotravel@gmail.com','pasword',CURTIME());
INSERT INTO users VALUES(NULL, 'ROLE_USER', 'Hercules', 'Dios', 'hercu@dios.com','pasword',CURTIME());
INSERT INTO users VALUES(NULL, 'ROLE_USER', 'Paco', 'Peco', 'pico@poco.com','pasword',CURTIME());

CREATE TABLE IF NOT EXISTS tasks(
id														int(255) auto_increment not null,
user_id									int(255) not null,
title											varchar(255),
content									text,
priority								varchar(20),
hours											int(100),
created_at						datetime,
CONSTRAINT pk_tasks PRIMARY KEY(id),
CONSTRAINT fk_task_user FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDB;

INSERT INTO tasks VALUES(NULL, 1, 'Tarea 1', 'Contenido de prueba 1', 'high',40,CURTIME());
INSERT INTO tasks VALUES(NULL, 1, 'Tarea 2', 'Contenido de prueba 1', 'high',240,CURTIME());
INSERT INTO tasks VALUES(NULL, 2, 'Tarea 1', 'Contenido de prueba 1', 'high',940,CURTIME());
INSERT INTO tasks VALUES(NULL, 3, 'Tarea 1', 'Contenido de prueba 1', 'high',30,CURTIME());
INSERT INTO tasks VALUES(NULL, 4, 'Tarea 1', 'Contenido de prueba 1', 'high',55,CURTIME());