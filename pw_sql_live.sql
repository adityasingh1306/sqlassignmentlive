1.Create a table called employees with the following structure? : 

emp_id (integer, should not be NULL and should be a primary key)
  emp_name (text, should not be NULL)
 age (integer, should have a check constraint to ensure the age is at least 18)
Q : email (text, should be unique for each employee)Q : salary (decimal, with a default value of 30,000).
Write the SQL query to create the above table with all constraints.

CREATE TABLE employees ( emp_id INT NOT NULL PRIMARY KEY, emp_name TEXT NOT NULL, age INT CHECK (age >= 18), email TEXT UNIQUE, salary DECIMAL(10, 2) DEFAULT 30000 );

Q2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.

Constraints are rules enforced on data column to ensure the integrity and accuracy of the data stored. They help in to  maintain the integrity of the database by restricting the type of data that can be entered in the database.
CREATE TABLE employees ( emp_id INT NOT NULL PRIMARY KEY, emp_name TEXT NOT NULL, age INT CHECK (age >= 18), email TEXT UNIQUE, salary DECIMAL(10, 2) DEFAULT 30000 );
Primary Key – Primary key is a combination of both the constraints unique and not null . If we want to apply primary in a column then unique and not null constraints is automatically present in that column.
Unique- A Unique Constraint is a rule applied to a column in a table to ensure that all the values in that column are distinct.
Not Null- The NOT NULL constraint in SQL ensures that a column cannot have a NULL value.



Q3. .Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

Not Null- The NOT NULL constraint in SQL ensures that a column cannot have a NULL value.
Primary key- No, a primary key cannot contain NULL values.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_no int );
INSERT INTO orders (order_id, order_no) VALUES (NULL,””);

Q4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.

In SQL, you can modify an existing table to add or remove constraints using the ALTER TABLE command.
Adding Constraints: Use ALTER TABLE  ADD CONSTRAINT to add new rules to ensure data integrity.
 Removing Constraints: Use ALTER TABLE  DROP CONSTRAINT to remove rules

ALTER TABLE employees ALTER COLUMN emp_name SET NOT NULL;
ALTER TABLE employees ALTER COLUMN emp_name drop NOT NULL;


Q5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.

When you attempt to insert, update, or delete data in a way that violates the constraints defined on a table, the database will prevent the operation and generate an error.
INSERT INTO employees (emp_id, emp_name, age) VALUES (1, NULL, 25);



Q6. You created a products table without constraints as follows: 
CREATE TABLE products (product_id INT,     product_name VARCHAR(50),     price DECI@AL(10; 2));
Now, you realise that?
 : The product_id should be a primary key
Q : The price should have a default value of 50.00

ALTER TABLE products ADD CONSTRAINT new_product_id PRIMARY KEY (product_id);
ALTER TABLE products ALTER COLUMN price SET DEFAULT 50.00;


7.You have two tables: 

 Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

use pw_assignment;
create table Students(student_id int , student_name char(50) ,class_id int);
insert into  Students values("1","Alice","101"),("2","Bob","102"),("3","Charlie","101");
select * from Students;
create table Classes(class_id int , class_name char(50));
insert into  Classes values("101","Math"),("102","Science"),("103","History");
select * from Classes;
select Students.student_name,Classes.class_name from Students inner join Classes on Students.class_id= Classes.class_id;


Q8. Consider the following three tables:
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order  Hint: (use INNER JOIN and LEFT JOIN)
use pw_assignment;
create table Orders(order_id int , order_date date ,customer_id int);
insert into  Orders values("1","2024-01-01","101"),("2","2024-01-03","102");
select * from Orders;

create table Customers(customer_id int , customer_name char(50));
insert into  Customers values("101","Alice"),("102","Bob");
select * from Customers;

create table Products(product_id int , product_name char(50),order_id varchar(50));
insert into  Products values("1","Laptop","1"),("2","Phone","NULL");
select * from Products;

SELECT Orders.order_id, Customers.customer_name,  Products.product_name FROM Products LEFT JOIN Orders ON Products.order_id = Orders.order_id LEFT JOIN Customers ON Orders.customer_id = Customers.customer_id;



Q9. Given the following tables:
Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

create table Sales(  sale_id int , product_id int, amount int);
insert into Sales values("1","101","500"),("2","102","300"),("3","101","700");
select * from Sales;
create table Products(  product_id int , product_name char(50));
insert into Products values("101","Laptop"),("102","Phone");
select * from Products;
select sum(Sales.amount) sales_amount , Products.product_name from Sales inner join Products on Sales.product_id =Products.product_id group by Products.product_name;

Q10. You are given three tables:
Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

create table Orders(order_id int,order_date date ,customer_id int);
insert into Orders values( "1","2024-01-02","1"),("2","2024-01-05","2");
select * from Orders;
create table Customers(customer_id int,customer_name char(90));
insert into Customers values( "1","Alice"),("2","Bob");
select * from Customers;
create table Order_Details(order_id int,product_id int,quantity int);
insert into Order_Details values( "1","101","2"),("1","102","1"),("2","101","3");
select * from Order_Details;

select Orders.order_id,Customers.customer_name, Order_Details.quantity from Orders Inner join Customers on Orders.customer_id=Customers.customer_id 
inner join Order_Details on Order_Details.order_id=Orders.order_id ;


SQL Commands

1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences

Primary Key :-  A column that uniquely identifies each row in a table.
                           2. Ensures that each value is unique.
                            3. Cannot contain NULL values.
foreign keys :- A column that creates a link between two tables.
                           2. Can contain duplicate values
                           3. can contain Null values.
actor, actor_award, address


2- List all details of actors
use mavenmovies;
select * from actor;
select year(last_update) from actor;
select month(last_update) from actor; 
select day(last_update) from actor; 
select time (last_update) from actor;
select concat(first_name," ",last_name) Actor_Names from actor;

3 -List all customer information from DB.

use mavenmovies;
select * from customer;
select customer_id,concat(first_name , " ", last_name) Name ,email , create_date from customer;
select customer_id,store_id,active, create_date ,  last_update from customer;
select sum(active) total_active_customers from customer  ; 
select if(active=1,"Present","Not_Present") as Active_status  from customer;


4 -List different countries

select country from country;


5 -Display all active customers.

select concat(first_name , " ", last_name) Name , active from customer where active = 1;


6 -List of all rental IDs for customer with ID 1.

select rental_id , staff_id from rental where staff_id=1;

7 - Display all the films whose rental duration is greater than 5 .

select title, rental_duration from film where rental_duration >5;

8 - List the total number of films whose replacement cost is greater than $15 and less than $20.

select title , replacement_cost from film where replacement_cost >15 and replacement_cost<20;
9 - Display the count of unique first names of actors.

select count( distinct first_name) count_of_unique  from actor;


10- Display the first 10 records from the customer table .
select * from customer limit 10;

11 - Display the first 3 records from the customer table whose first name starts with ‘b’.

select * from customer where first_name like "b%" limit 3;

12 -Display the names of the first 5 movies which are rated as ‘G’.
select title , rating from film where rating = "G" limit 5;

13-Find all customers whose first name starts with "a".
select * from customer where first_name like "a%";

14- Find all customers whose first name ends with "a".
select * from customer where first_name like "%a";

15- Display the list of first 4 cities which start and end with ‘a’ .

select * from city where city like "a%" and city like "%a" limit 4;

16- Find all customers whose first name have "NI" in any position

select * from customer where first_name like "%Nl%";

17- Find all customers whose first name have "r" in the second position .
select * from customer where first_name like "_r%";
18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.

select * from customer where first_name like "a%" and length(First_name)>=5;

19- Find all customers whose first name starts with "a" and ends with "o".

select * from customer where first_name like "a%" and first_name like "%o";

20 - Get the films with pg and pg-13 rating using IN operator.

21 - Get the films with length between 50 to 100 using between operator.

select * from film where length BETWEEN 50 AND 100;

22 - Get the top 50 actors using limit operator.
select concat(first_name," ",last_name) Name from actor order by Name desc limit 50 ;


23 - Get the distinct film ids from inventory table.

select distinct(film_id) from inventory;










Functions

Question 1:
 Retrieve the total number of rentals made in the Sakila database.
 Hint: Use the COUNT() function.
use sakila;
select count(rental_id) from rental;

Question 2:
 Find the average rental duration (in days) of movies rented from the Sakila database. Hint: Utilize the AVG() function.

select avg(day(rental_date)) rental_duration  from rental;


Question 3: 
Display the first name and last name of customers in uppercase. Hint: Use the UPPER () function.

select upper(first_name),upper(last_name) from customer;

Question 4:
 Extract the month from the rental date and display it alongside the rental ID. 
Hint: Employ the MONTH() function.
select rental_id,month(rental_date) from rental;

GROUP BY:
 Question 5: 
Retrieve the count of rentals for each customer (display customer ID and the count of rentals). 
Hint: Use COUNT () in conjunction with GROUP BY.

select customer_id, count(rental_id) from rental group by customer_id;
Question 6:
 Find the total revenue generated by each store. Hint: Combine SUM() and GROUP BY.
select sum(amount), customer_id from payment group by customer_id;

Question 7:
 Determine the total number of rentals for each category of movies. 
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
select * from film_category full join rental on rental.last_update= film_category.last_update;


Question 8:
 Find the average rental rate of movies in each language. 
Hint: JOIN film and language tables, then use AVG () and GROUP BY.

use sakila;
select * from film;
select * from language;
select film.avg(rental_rate), language.name from film full join language on film.last_update=language.last_update;


Joins

Questions 9 – 
Display the title of the movie, customer s first name, and last name who rented it. 
Hint: Use JOIN between the film, inventory, rental, and customer tables.

select film.title,customer.first_name,customer.last_name from rental
 INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
INNER JOIN customer ON rental.customer_id = customer.customer_id;


Question 10:
 Retrieve the names of all actors who have appeared in the film "Gone with the Wind." Hint: Use JOIN between the film actor, film, and actor tables.

select actor.first_name , film.title  from film_actor inner join film on film.film_id= film_actor.film_id
inner join actor on actor.actor_id = film_actor.actor_id   where title = "Gone with the Wind";


Question 11: 
Retrieve the customer names along with the total amount theyve spent on rentals.
 Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.

Select customer.first_name, customer.last_name, SUM(payment.amount) as total_amount_spent from customer INNER JOIN rental ON customer.customer_id = rental.customer_id INNER JOIN payment ON rental.rental_id = payment.rental_id GROUP BY customer.customer_id, customer.first_name, customer.last_name;


Question 12:
 List the titles of movies rented by each customer in a particular city (e.g., 'London'). Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.

select film.title,city.city from address inner join city on city.city_id = address.city_id 
inner join customer on  address.last_update = customer.last_update
inner join rental on customer.customer_id = rental.customer_id 
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id =film.film_id
group by film.title,city.city;


Advanced Joins and GROUP BY:


Question 13: 
Display the top 5 rented movies along with the number of times theyve been rented.
 Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.



select film.title ,count(film.rental_duration) times_rented from film inner join inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id  
group by film.title order by film.title desc limit 5;



Question 14: 
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). 
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

select customer.store_id,count(inventory.store_id) from customer inner join inventory on customer.store_id = inventory.store_id inner join rental on
inventory.inventory_id= rental.inventory_id group by customer.store_id;






Windows Function:

1.	Rank the customers based on the total amount theyve spent on rentals
select  amount, rank() over( order by amount desc) Rank_amount from payment;

2.	Calculate the cumulative revenue generated by each film over time.

Use sakila;
select sum(rental_rate) Cumulative_revenue  , title, last_update from film group by title , last_update;

3. Determine the average rental duration for each film, considering films with similar lengths.

select avg(rental_duration) , last_update from film group by last_update;

4. Identify the top 3 films in each category based on their rental counts.

SELECT category.name AS category_name, film.title AS film_title, COUNT(rental.rental_id) AS rental_count
FROM film INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY category.name, film.title
ORDER BY category_name desc limit 3;

5. Calculate the difference in rental counts between each customers total rentals and the average rentals across all customers.
  SELECT customer.customer_id,customer.first_name,customer.last_name,COUNT(rental.rental_id) AS total_rentals
FROM customer INNER JOIN rental ON customer.customer_id = rental.customer_id 
GROUP BY customer.customer_id, customer.first_name, customer.last_name ;
6. Find the monthly revenue trend for the entire rental store over time.

select Month(rental.rental_date) , film.rental_rate from rental INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id;


7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.



8. Calculate the running total of rentals per category, ordered by rental count.

9. Find the films that have been rented less than the average rental count for their respective categories.

select  title , rental_rate from film where rental_rate <=2.98;

10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

select month(payment_date),payment_date from payment group by payment_date order by month(payment_date) desc limit 5  ;









Normalisation & CTE


1. First Normal Form (1NF): 
a. Identify a table in the Sakila database that violates 1NF.
 Explain how you would normalize it to achieve 1NF.

select * from film_category;
In this the category_id column has not unique value and in this the value is repeating.

select * from address ;
In this address2 breaks the 1NF . We can prevent this by seperate this address2 column


#2. Second Normal Form (2NF): 
#a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.
: Must be in 1Nf
: Non key column must be dependent on candidate key.
: Every table should have primary key and relationship between the tables should be formed using foreign key.

#3.	Third Normal Form (3NF): a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
: Must be 2Nf and have 1 primary key.
Practical questions are not taught by sir, he only tells about the definition.

#4. Normalization Process:a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
CREATE TABLE film ( film_id INT PRIMARY KEY, title VARCHAR(255), description TEXT, release_year YEAR, language_id INT, rental_duration INT, rental_rate DECIMAL(4,2), length INT, replacement_cost DECIMAL(5,2), rating VARCHAR(5) );
CREATE TABLE film_special_features ( film_id INT, feature VARCHAR(50), FOREIGN KEY (film_id) REFERENCES film(film_id) );
CREATE TABLE language ( language_id INT PRIMARY KEY, name VARCHAR(20) );


#5. CTE Basics:a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables

select  distinct(actor.first_name) , film_actor.film_id from actor inner join film_actor on actor.actor_id = film_actor.actor_id;

#6. CTE with Joins: a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.

use mavenmovies;
select film.title film_title,language.name language_name ,film.rental_rate from film inner join language on film.language_id= language.language_id;

#7. CTE for Addredation: a. Write a query usi]g a CTE to fi]d the total reve]ue ge]erated by each customer (sum of payme]ts) from the customer a]d payment tables.

select customer.first_name, sum(payment.amount) from customer inner join payment on customer.customer_id=payment.customer_id group by customer.first_name ;

#8.CTE with Window Functions: a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.

select title,rank() over (order by rental_duration ) rental_duration from film;



#9. CTE and Filterind: a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details

WITH CustomerRentals AS (SELECT customer_id,COUNT(rental_id) AS rental_count FROM rental GROUP BY customer_id HAVING COUNT(rental_id) > 2)
SELECT c.customer_id,c.first_name,c.last_name,cr.rental_count FROM CustomerRentals AS cr JOIN customer AS c ON cr.customer_id = c.customer_id
ORDER BY cr.rental_count DESC;


#10. CTE for Date Calculations:
#a. Write a query using a CTE to find the total number of rentals made each month, considering the rental date from the rental table.

SELECT EXTRACT(YEAR FROM rental_date) AS rental_year,EXTRACT(MONTH FROM rental_date) AS rental_month,COUNT(rental_id) AS total_rentals FROM 
rental GROUP BY  EXTRACT(YEAR FROM rental_date), EXTRACT(MONTH FROM rental_date);

#11. CTE and Self-Join: 
#a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film actor table.
select actor.first_name,film.title from actor join film  on actor.last_update= film.last_update WHERE film_id = actor_id ;


#12. CTE for Recursive Search:
#a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports to column.

select staff.first_name , store.manager_staff_id from store
 inner join staff on store.store_id = staff.store_id;
