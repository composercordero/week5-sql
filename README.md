# week5-sql

## Day 1 - Exercise 1
Questions to search on dvd rental DB

```md
-- SYNTAX ORDER: (SELECT and FROM are the only mandatory)

-- You can put them in one line but better to put them in several lines in the following order:

-- SELECT (columns from table)
-- FROM (table name)
-- WHERE (row filter)
-- GROUP BY (aggregations)
-- HAVING (filter aggregations)
-- ORDER BY (column value ASC or DESC)
-- OFFSET (number of rows to skip)
-- LIMIT (max number of rows to display)
```

## Day 2 - ERD and DDL (Data Definition Language)
Content

Using LucidChart, create an ERD for a movie theater (customers, tickets, movies, and theaters at minimum, but you can have more). Use the following rules for the movie theater:

- A customer can purchase tickets to see movies, though a customer does not have to have had purchased a ticket to be a customer
- Each ticket is only good for one customer to see one movie
- Each movie can be shown in each theater, and every theater can show any movie

The ERD should show the relationships with both cardinality (maximum relationships) and ordinality (minimum). The entities should also show Primary and Foreign Keys, any additional fields, and data types.

Once the ERD is completed, create the tables in the database using the relationships, constraints, and columns that you defined in your ERD. Make sure you save your create statements to a .sql file since we won't have access to your database. 

NOTE: For an added challenge, feel free to also play around with changing/altering the database tables.

In total for this homework assignment, you should have 2 files in your repository - 1 PDF for the ERD, 1 .sql file for creating tables

Once done, commit the ERD as a PDF and the SQL file to GitHub and submit the link to the assignment

## Day 3 - SQL Joins and Subqueries

1. List all customers who live in Texas (use JOINs)
2. List all payments of more than $7.00 with the customer’s first and last name
3. Show all customer names who have made over $175 in payments (use
subqueries)
4. List all customers that live in Argentina (use the city table)
5. Show all the film categories with their count in descending order
6. What film had the most actors in it (show film info)?
7. Which actor has been in the least movies?
8. Which country has the most cities?
9. List the actors who have been in between 20 and 25 films.


## Day 4 - 

