-- Databricks notebook source
-- DBTITLE 1,Question1
-- MAGIC %md
-- MAGIC product_id is the primary key (column with unique values) for this table.
-- MAGIC low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
-- MAGIC recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
-- MAGIC
-- MAGIC Write a query to find the ids of products that are both low fat and recyclable.
-- MAGIC
-- MAGIC Input:
-- MAGIC
-- MAGIC Table:Products
-- MAGIC
-- MAGIC
-- MAGIC | product_id  | low_fats | recyclable |
-- MAGIC |-------------|----------|------------|
-- MAGIC | 0           | Y        | N          |
-- MAGIC | 1           | Y        | Y          |
-- MAGIC | 2           | N        | Y          |
-- MAGIC | 3           | Y        | Y          |
-- MAGIC | 4           | N        | N          |
-- MAGIC
-- MAGIC Output:
-- MAGIC
-- MAGIC
-- MAGIC | product_id  |
-- MAGIC |-------------|
-- MAGIC | 1           |
-- MAGIC | 3           |
-- MAGIC
-- MAGIC
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Answer
Select product_id from Products
where low_fats = 'Y' and recyclable = 'Y';

-- COMMAND ----------

-- DBTITLE 1,Question 2
-- MAGIC %md
-- MAGIC Find the names of the customer that are not referred by the customer with id = 2.
-- MAGIC Return the result table in any order.
-- MAGIC
-- MAGIC Input: 
-- MAGIC Table:Customer
-- MAGIC
-- MAGIC | id | name | referee_id |
-- MAGIC |----|------|------------|
-- MAGIC | 1  | Will | null       |
-- MAGIC | 2  | Jane | null       |
-- MAGIC | 3  | Alex | 2          |
-- MAGIC | 4  | Bill | null       |
-- MAGIC | 5  | Zack | 1          |
-- MAGIC | 6  | Mark | 2          |
-- MAGIC
-- MAGIC Output: 
-- MAGIC
-- MAGIC | name |
-- MAGIC |------|
-- MAGIC | Will |
-- MAGIC | Jane |
-- MAGIC | Bill |
-- MAGIC | Zack |
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Answer 
Select name from Customer
where referee_id !=2 or referee_id is Null;

-- COMMAND ----------

-- DBTITLE 1,Question3
-- MAGIC %md
-- MAGIC A country is big if:
-- MAGIC
-- MAGIC it has an area of at least three million (i.e., 3000000 km2), or
-- MAGIC it has a population of at least twenty-five million (i.e., 25000000).
-- MAGIC Write a solution to find the name, population, and area of the big countries.
-- MAGIC
-- MAGIC Input: 
-- MAGIC Table:World
-- MAGIC
-- MAGIC | name        | continent | area    | population | gdp          |
-- MAGIC |-------------|-----------|---------|------------|--------------|
-- MAGIC | Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
-- MAGIC | Albania     | Europe    | 28748   | 2831741    | 12960000000  |
-- MAGIC | Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
-- MAGIC | Andorra     | Europe    | 468     | 78115      | 3712000000   |
-- MAGIC | Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
-- MAGIC
-- MAGIC
-- MAGIC Output: 
-- MAGIC
-- MAGIC | name        | population | area    |
-- MAGIC |-------------|------------|---------|
-- MAGIC | Afghanistan | 25500100   | 652230  |
-- MAGIC | Algeria     | 37100000   | 2381741 |
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Answer
Select name,population,area from World 
where population >= 25000000 or area >=3000000

-- COMMAND ----------

-- DBTITLE 1,Question4
-- MAGIC %md
-- MAGIC Write a solution to find all the authors that viewed at least one of their own articles.
-- MAGIC Return the result table sorted by id in ascending order.
-- MAGIC
-- MAGIC Input: 
-- MAGIC Table:Views
-- MAGIC
-- MAGIC | article_id | author_id | viewer_id | view_date  |
-- MAGIC |------------|-----------|-----------|------------|
-- MAGIC | 1          | 3         | 5         | 2019-08-01 |
-- MAGIC | 1          | 3         | 6         | 2019-08-02 |
-- MAGIC | 2          | 7         | 7         | 2019-08-01 |
-- MAGIC | 2          | 7         | 6         | 2019-08-02 |
-- MAGIC | 4          | 7         | 1         | 2019-07-22 |
-- MAGIC | 3          | 4         | 4         | 2019-07-21 |
-- MAGIC | 3          | 4         | 4         | 2019-07-21 |
-- MAGIC
-- MAGIC Output: 
-- MAGIC
-- MAGIC | id   |
-- MAGIC |------|
-- MAGIC | 4    |
-- MAGIC | 7    |
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Answer
Select distinct author_id as id from Views 
where author_id = viewer_id
order by author_id asc

-- COMMAND ----------

-- DBTITLE 1,Question 5 
-- MAGIC %md
-- MAGIC Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
-- MAGIC Input: 
-- MAGIC
-- MAGIC Table:Tweets
-- MAGIC
-- MAGIC | tweet_id | content                          |
-- MAGIC |----------|----------------------------------|
-- MAGIC | 1        | Vote for Biden                   |
-- MAGIC | 2        | Let us make America great again! |
-- MAGIC
-- MAGIC Output: 
-- MAGIC
-- MAGIC | tweet_id |
-- MAGIC |----------|
-- MAGIC | 2        |
-- MAGIC

-- COMMAND ----------

-- DBTITLE 1,Answer
Select tweet_id from Tweets
where length(content) > 15
