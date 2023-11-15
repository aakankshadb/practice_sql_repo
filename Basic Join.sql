-- Databricks notebook source
-- DBTITLE 1,Question1
-- MAGIC %md
-- MAGIC Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
-- MAGIC
-- MAGIC Input: 
-- MAGIC Table1:Employees
-- MAGIC
-- MAGIC | id | name     |
-- MAGIC |----|----------|
-- MAGIC | 1  | Alice    |
-- MAGIC | 7  | Bob      |
-- MAGIC | 11 | Meir     |
-- MAGIC | 90 | Winston  |
-- MAGIC | 3  | Jonathan |
-- MAGIC
-- MAGIC Table2:EmployeeUNI
-- MAGIC
-- MAGIC | id | unique_id |
-- MAGIC |----|-----------|
-- MAGIC | 3  | 1         |
-- MAGIC | 11 | 2         |
-- MAGIC | 90 | 3         |
-- MAGIC
-- MAGIC Output: 
-- MAGIC
-- MAGIC | unique_id | name     |
-- MAGIC |-----------|----------|
-- MAGIC | null      | Alice    |
-- MAGIC | null      | Bob      |
-- MAGIC | 2         | Meir     |
-- MAGIC | 3         | Winston  |
-- MAGIC | 1         | Jonathan |
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Answer
Select EmployeeUNI.unique_id,Employees.name
FROM Employees
Left join EmployeeUNI ON Employees.id=EmployeeUNI.id


-- COMMAND ----------

-- DBTITLE 1,Question2
-- MAGIC %md
-- MAGIC Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
-- MAGIC Input: 
-- MAGIC Table1:Sales
-- MAGIC
-- MAGIC | sale_id | product_id | year | quantity | price |
-- MAGIC |---------|------------|------|----------|-------| 
-- MAGIC | 1       | 100        | 2008 | 10       | 5000  |
-- MAGIC | 2       | 100        | 2009 | 12       | 5000  |
-- MAGIC | 7       | 200        | 2011 | 15       | 9000  |
-- MAGIC
-- MAGIC Table2:Product
-- MAGIC
-- MAGIC | product_id | product_name |
-- MAGIC |------------|--------------|
-- MAGIC | 100        | Nokia        |
-- MAGIC | 200        | Apple        |
-- MAGIC | 300        | Samsung      |
-- MAGIC
-- MAGIC Output: 
-- MAGIC
-- MAGIC | product_name | year  | price |
-- MAGIC |--------------|-------|-------|
-- MAGIC | Nokia        | 2008  | 5000  |
-- MAGIC | Nokia        | 2009  | 5000  |
-- MAGIC | Apple        | 2011  | 9000  |
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Answer
Select Product.product_name,Sales.year,Sales.price
from Product
inner join Sales on Product.product_id=Sales.product_id
order by product_name asc;
