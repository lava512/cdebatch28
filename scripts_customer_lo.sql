CREATE DATABASE IF NOT EXISTS raw_db 
LOCATION 'gs://cdebatch28lavasdk/raw.db';

USE raw_db;

CREATE OR REPLACE TEMPORARY VIEW customer_lo_v 
USING JSON
OPTIONS (
    path='gs://cdebatch28lavasdk/source/customer_lo.json'
);

CREATE TABLE IF NOT EXISTS raw_db.customer_lo
USING PARQUET
SELECT * FROM customer_lo_v;