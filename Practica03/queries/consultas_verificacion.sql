USE db_test;

/* 1. Cuantas tablas tenemos? */
-- En la práctica 3 agregamos 2 nuevas categorias y productos_categorias
SHOW TABLES;

/* 2. Cuantos triggers tenemos */ 
-- 12 Por cada tabla creada deberan estar 3 trigger para poder realizar la trazabilidad de bitacora
SHOW TRIGGERS FROM db_test;