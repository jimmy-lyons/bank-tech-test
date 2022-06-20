CREATE DATABASE bank_tech;
CREATE DATABASE bank_tech_test;

-- the following instructions should be applied to each of the databases above

CREATE TABLE accounts ( user_id serial PRIMARY KEY, username VARCHAR (100) , balance DECIMAL (12, 2));