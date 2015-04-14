CREATE DATABASE ninja_coffee_app;
\c ninja_coffee_app

CREATE TABLE products (id SERIAL PRIMARY KEY, name VARCHAR(255), description VARCHAR(255));