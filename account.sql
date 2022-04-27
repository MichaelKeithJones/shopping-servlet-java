CREATE DATABASE IF NOT EXISTS shopping_db;

CREATE USER shopping_user@localhost IDENTIFIED BY 'codeup';
GRANT ALL ON shopping_db.* TO shopping_user@localhost;

