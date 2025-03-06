-- Vorbereitung DB

DROP DATABASE IF EXISTS design;

-- Zeichensatz in der DB
CREATE DATABASE design
COLLATE utf8mb4_unicode_ci  
;

-- Zeichensatz für die Session 
SET NAMES utf8mb4;

