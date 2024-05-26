CREATE DATABASE IF NOT EXISTS raw_db 
LOCATION 'gs://cdebatch28lavasdk/raw.db';

USE raw_db;

CREATE OR REPLACE TEMPORARY VIEW orders_v 
USING JSON
OPTIONS (
    path='gs://cdebatch28lavasdk/source/orders.json'
);

CREATE TABLE IF NOT EXISTS raw_db.orders
USING PARQUET
SELECT * FROM orders_v;