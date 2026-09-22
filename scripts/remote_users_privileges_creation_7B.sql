/* ============================================================
   CREACIÓN DE USUARIOS REMOTOS
   ============================================================ */

CREATE USER IF NOT EXISTS 'marco.ramirez'@'%'
IDENTIFIED BY 'qwerty123';

CREATE USER IF NOT EXISTS 'nombre.apellido'@'%'
IDENTIFIED BY 'sumatricula';

CREATE USER IF NOT EXISTS 'eutiquio.cruz'@'%'
IDENTIFIED BY '240046';

CREATE USER IF NOT EXISTS 'samuel.vargas'@'%'
IDENTIFIED BY '240023';

CREATE USER IF NOT EXISTS 'gadiel.bobadilla'@'%'
IDENTIFIED BY '240349';


/* ============================================================
   ASIGNACIÓN DE PRIVILEGIOS DIRECTOS
   ============================================================ */

/*
IMPORTANTE:
Este privilegio solamente debe asignarse al usuario administrador.
*/

GRANT ALL PRIVILEGES ON *.*
TO 'nombre.apellido'@'%';


/*
Asignar privilegios CRUD sobre la base db_test_7b.
*/

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test_7b.*
TO 'samuel.vargas'@'%';


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
ON db_test_7b.*
TO 'admin';


/* SUPPORT */
GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_users
TO 'support';

GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_products
TO 'support';

/* SELLER */
GRANT SELECT, INSERT, UPDATE
ON db_test_7b.tb_products
TO 'seller';

/* ============================================================
   ASIGNACIÓN DE ROLES A LOS USUARIOS
   ============================================================ */

-- Este deben ser ustedes
GRANT 'superadmin'
TO 'marco.ramirez'@'%';

-- Este debe ser el Prof. Marco
GRANT 'admin'
TO 'marco.ramirez'@'%';

-- IZQUIERDA
GRANT 'support'
TO 'samuel.vargas'@'%';

-- DERECHA
GRANT 'seller'
TO 'eutiquio.cruz'@'%';

GRANT 'seller'
TO 'gadiel.bobadilla'@'%';

/* ============================================================
   ESTABLECER ROLES PREDETERMINADOS
   ============================================================ */

/*
Esto permite que el rol se active automáticamente cuando
el usuario inicia sesión.
*/

SET DEFAULT ROLE 'admin'
TO 'marco.ramirez'@'%';

SET DEFAULT ROLE 'support'
TO 'samuel.vargas'@'%';

SET DEFAULT ROLE 'seller'
TO 'eutiquio.cruz'@'%';
SET DEFAULT ROLE 'seller'
TO 'gadiel.bobadilla'@'%';


/* ============================================================
   VERIFICACIÓN
   ============================================================ */

/* Mostrar usuarios remotos creados */
SELECT "Los usuarios y privilegios han sido creados correctamente" AS mensaje;





