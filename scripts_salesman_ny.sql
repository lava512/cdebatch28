CREATE DATABASE IF NOT EXISTS raw_db 
LOCATION 'gs://cdebatch28lavasdk/raw.db';

USE raw_db;

CREATE OR REPLACE TEMPORARY VIEW salesman_ny_v 
USING JSON
OPTIONS (
    path='gs://cdebatch28lavasdk/source/salesman_ny.json'
);

CREATE TABLE IF NOT EXISTS raw_db.salesman_ny
USING PARQUET
SELECT * FROM salesman_ny_v;