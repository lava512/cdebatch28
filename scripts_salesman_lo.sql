CREATE DATABASE IF NOT EXISTS raw_db 
LOCATION 'gs://cdebatch28lavasdk/raw.db';

USE raw_db;

CREATE OR REPLACE TEMPORARY VIEW salesman_lo_v 
USING JSON
OPTIONS (
    path='gs://cdebatch28lavasdk/source/salesman_lo.json'
);

CREATE TABLE IF NOT EXISTS raw_db.salesman_lo
USING PARQUET
SELECT * FROM salesman_lo_v;