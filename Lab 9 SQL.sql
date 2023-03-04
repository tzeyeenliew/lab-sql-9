Use sakila;

### Instructions
### In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.

### 1. Create a table rentals_may to store the data from rental table with information for the month of May.

SELECT *
FROM RENTAL
LIMIT 5;

SHOW COLUMNS FROM rental;

CREATE TABLE rental_may(
rental_id int(10) NOT NULL,
rental_date DATETIME NOT NULL,
inventory_id mediumint unsigned NOT NULL,
customer_id smallint unsigned NOT NULL,
return_date datetime DEFAULT NULL,
staff_id tinyint unsigned NOT NULL,
last_update timestamp NOT NULL
);

SHOW COLUMNS FROM rental_may;



### 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.



INSERT INTO rental_may (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update FROM rental
WHERE rental_date BETWEEN 050501 AND 050531;

SELECT *
FROM rental_may
LIMIT 5;

### 3. Create a table rentals_june to store the data from rental table with information for the month of June.

CREATE TABLE rental_june(
rental_id int(10) NOT NULL,
rental_date DATETIME NOT NULL,
inventory_id mediumint unsigned NOT NULL,
customer_id smallint unsigned NOT NULL,
return_date datetime DEFAULT NULL,
staff_id tinyint unsigned NOT NULL,
last_update timestamp NOT NULL
);

### 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

INSERT INTO rental_june(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update FROM rental
WHERE rental_date BETWEEN 050601 AND 050630;

SELECT *
FROM rental_june
LIMIT 5;

### 5. Check the number of rentals for each customer for May.

SELECT customer_id,  COUNT(rental_id)
FROM rental_may
GROUP BY customer_id
ORDER by COUNT(rental_id) DESC;

###. 6. Check the number of rentals for each customer for June.

SELECT customer_id,  COUNT(rental_id)
FROM rental_june
GROUP BY customer_id
ORDER by COUNT(rental_id) DESC;

### 7. Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

### SEE PYTHON


