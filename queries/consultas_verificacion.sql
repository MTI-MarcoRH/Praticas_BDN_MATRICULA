USE db_test;

/* 1. Cuantas tablas existen en la base de datos db_test_7b? */
SHOW TABLES;

/* 2. Cuanto triggers existen en la base de datos db_test_7b? */
SHOW TRIGGERS FROM db_test;

/* 3. Cuantos registros existen en la tabla users? */
-- Total de Usuarios
SELECT COUNT(*) AS total_registros FROM tb_users;
-- Visualizacion de los Usarios
SELECT * FROM tb_users;
-- Consulta para verificar que usuario de la base de datos , 
-- inserto a que usuario de la plataforma ecommerce, agregando el rol del SGBD */
SELECT 
    u.nick,
    u.email,
    b.db_user AS inserted_by,
    GROUP_CONCAT(
        DISTINCT re.FROM_USER
        ORDER BY re.FROM_USER
        SEPARATOR ', '
    ) AS roles,
    b.operation_description,
    b.operation_date
FROM tb_users u
JOIN tb_logs b
    ON b.operation_description LIKE CONCAT('%', u.nick, '%')
   AND b.operation_description LIKE CONCAT('%', u.email, '%')

LEFT JOIN mysql.role_edges re
    ON re.TO_USER = SUBSTRING_INDEX(b.db_user, '@', 1)

WHERE b.table_operation = 'Create'
  AND b.table_name = 'tb_users'

GROUP BY
    u.nick,
    u.email,
    b.db_user,
    b.operation_description,
    b.operation_date
ORDER BY b.operation_date asc;
  
  
  

/* 4. Cuantos registros existen en la tabla bitácora? */
SELECT COUNT(*) AS total_registros FROM tb_logs;

/* 5. Consultar todas las operaciones realizadas en la base de datos */
SELECT * FROM tb_logs;

/* 6. Verificar que los usuarios remotos hayan sido creados */
SELECT User, Host FROM mysql.user WHERE Host = '%'  AND account_locked = 'N';

/* 7. Verificar los roles que fueron creados */
SELECT User, Host FROM mysql.user WHERE Host = '%'  AND account_locked = 'Y';

/* 8. Verificar que usuarios tienen que roles */
SELECT  TO_USER AS usuario,  TO_HOST AS host, FROM_USER AS rol, FROM_HOST AS rol_host
FROM mysql.role_edges ORDER BY TO_USER, FROM_USER;

/* 9. Verificar el total de procedimientos almacenados que existen en la base de datos db_test_7b */
SHOW PROCEDURE STATUS WHERE Db = 'db_test_7b';


/* 10. Verificación de Productos*/
/* Contabilizar los productos */
SELECT COUNT(*) FROM tb_products;

/* Visualizar todos los productos */
SELECT * FROM tb_products;

/* Consulta para saber la trazabilidad de los productos */
SELECT * FROM vw_trazabilidad_productos LIMIT 10;

