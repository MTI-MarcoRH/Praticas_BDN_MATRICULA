/* Creación de usuarios remotos */
CREATE USER 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER 'nombre.apellido'@'%' IDENTIFIED BY 'sumatricula';
CREATE USER 'eutiquio.cruz'@'%' IDENTIFIED BY '240046';
CREATE USER 'samuel.vargas'@'%' IDENTIFIED BY '240023';

/* Asignar los privilegios de super usuario  IMPORTATNE: SOLO USTEDES!! */
GRANT ALL PRIVILEGES ON *.* TO 'nombre.apellido'@'%';

/* ASIGNAR PRIVILECIOS DE SELECCION, INSERCIÓN, ACTUALIZACIÓN Y ELIMINACIÓN AL USUARIO DE IZQUIERDA */
GRANT SELECT, UPDATE, INSERT, DELETE ON db_test_7b.* TO 'samuel.vargas'@'%';

/*CREACIÓN DE ROLES PARA EL SISTEMA DE ECOMMERCE */
CREATE ROLE 'admin';
CREATE ROLE 'seller';
CREATE ROLE 'buyer';
CREATE ROLE 'support';
CREATE ROLE 'common';
CREATE ROLE 'user_not_registered';


/* ASIGNAR PRIVILEGIOS A LOS ROLES CREADOS */
-- ADMIN
GRANT ALL PRIVILEGES ON db_test_7b.* TO 'admin';
-- SUPPORT 
GRANT SELECT, UPDATE, INSERT ON db_test_7b.* TO 'support';


/* ASIGNAR ROLES A LOS USUARIOS CREADOS */
GRANT 'admin' TO 'marco.ramirez'@'%';
GRANT 'support' TO 'samuel.vargas'@'%';







