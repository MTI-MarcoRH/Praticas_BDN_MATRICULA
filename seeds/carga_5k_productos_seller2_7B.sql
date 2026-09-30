LOAD DATA LOCAL INFILE 'C:\Users\PC-01\Documents\7B-ITIID\BDN\Praticas_BDN_MATRICULA\seeds\carga_5k_productos_seller2_7B.sql'
INTO TABLE tb_productos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    id, sku, name, description, current_price, current_stock,       creation_date, last_update, @status
)
SET status = IF(@status = '1', b'1', b'0');