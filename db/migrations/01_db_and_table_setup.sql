CREATE DATABASE bank_tech;
CREATE DATABASE bank_tech_test;

-- the following instructions should be applied to each of the databases above

CREATE TABLE accounts ( user_id serial PRIMARY KEY, username VARCHAR (100) , balance DECIMAL (12, 2));

CREATE TABLE transactions ( 
  transaction_id serial PRIMARY KEY,
  transaction_date VARCHAR(20),
  user_id INTEGER, 
  credit DECIMAL (12, 2),
  debit DECIMAL (12, 2),
  balance DECIMAL (12, 2)
);