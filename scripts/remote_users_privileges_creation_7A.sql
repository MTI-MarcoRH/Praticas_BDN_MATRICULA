/* ============================================================
   CREACIÓN DE USUARIOS REMOTOS
   ============================================================ */

CREATE USER IF NOT EXISTS 'marco.ramirez'@'%'
IDENTIFIED BY 'qwerty123';

CREATE USER IF NOT EXISTS 'nombre.apellido'@'%'
IDENTIFIED BY 'sumatricula';

CREATE USER IF NOT EXISTS 'natalia.martinez'@'%'
IDENTIFIED BY '240537';

CREATE USER IF NOT EXISTS 'saul.barrios'@'%'
IDENTIFIED BY '240196';

CREATE USER IF NOT EXISTS 'ivan.flores'@'%'
IDENTIFIED BY '240793';

CREATE USER IF NOT EXISTS 'yazmin.esquivel'@'%'
IDENTIFIED BY '240235';


/* ============================================================
   ASIGNACIÓN DE PRIVILEGIOS DIRECTOS
   ============================================================ */

/*
IMPORTANTE:
Este privilegio solamente debe asignarse al usuario administrador
*/

GRANT ALL PRIVILEGES ON *.*
TO 'nombre.apellido'@'%';


/*
Asignar privilegios CRUD sobre la base db_test. solo 1 vez al usuario sin rol
no es considerada una buena práctica ya podría generar problemas de seguridad, 
pero es para fines de aprendizaje.
*/

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test.*
TO 'natalia.martinez'@'%';


/* ============================================================
   CREACIÓN DE ROLES PARA EL SISTEMA E-COMMERCE
   ============================================================ */

CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'support';
CREATE ROLE IF NOT EXISTS 'common';
CREATE ROLE IF NOT EXISTS 'user_not_registered';


/* ============================================================
   ASIGNACIÓN DE PRIVILEGIOS A LOS ROLES
   ============================================================ */

/* SUPERADMIN */
GRANT ALL PRIVILEGES
ON *.*
TO 'superadmin';    

/* ADMIN */
GRANT ALL PRIVILEGES
ON db_test.*
TO 'admin';


/* SUPPORT */
GRANT SELECT, INSERT, UPDATE
ON db_test.tb_users
TO 'support';

GRANT SELECT, INSERT, UPDATE
ON db_test.tb_products
TO 'support';

/* SELLER */
GRANT SELECT, INSERT, UPDATE
ON db_test.tb_products
TO 'seller';

/* ============================================================
   ASIGNACIÓN DE ROLES A LOS USUARIOS
   ============================================================ */

-- Este deben ser ustedes
GRANT 'superadmin'
TO 'nombre.apellido'@'%';

-- Este debe ser el Prof. Marco
GRANT 'admin'
TO 'marco.ramirez'@'%';

-- SOPORTE
GRANT 'support'
TO 'saul.barrios'@'%';

-- VENDEDORES
GRANT 'seller'
TO 'yazmin.esquivel'@'%';

GRANT 'seller'
TO 'ivan.flores'@'%';

/* ============================================================
   ESTABLECER ROLES PREDETERMINADOS
   ============================================================ */

/*
Esto permite que el rol se active automáticamente cuando
el usuario inicia sesión.
*/
SET DEFAULT ROLE 'superadmin'
TO 'nombre.apellido'@'%';

SET DEFAULT ROLE 'admin'
TO 'marco.ramirez'@'%';

SET DEFAULT ROLE 'support'
TO 'saul.barrios'@'%';

SET DEFAULT ROLE 'seller'
TO 'yazmin.esquivel'@'%';
SET DEFAULT ROLE 'seller'
TO 'ivan.flores'@'%';


/* ============================================================
   MENSAJE DE CONFIRMACIÓN
   ============================================================ */

SELECT "Los usuarios y privilegios han sido creados correctamente" AS mensaje;





