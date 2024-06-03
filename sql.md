## The chapters are divided into basics, advanced and professional section
Types of db - Relational and non relational db

The query - it is a request for data from a database that allows one to perform various operations
Exampels are: CRUD - Create, Read, Update and Delete
storage-- server or your pc 

the databases ::

- relational database store data in tables
- They have associated tables that have unique IDS that are able to assoviate with the databases
- non relational databases - NOSQL  - they support unstructured data example key value based, column based or graph based
- ENtity relationship table

## Command prompts

The are :
- Seclect/ From
- limit
- distinct
- where
- comments
- /**/ multiline comments
- order by

#### Select * /FROM
- Select identifies the columns(or data) from a database
- From - identifies the table we are connecting to
- * Special command to select all the columns
 <img width="668" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/8ad57cbf-d813-4b3e-a7a7-836b2434e8f0">
  - **limit 5 ** - limit the query to a certain number or rows.. The select alll is rarely used since it consumes a lot of CPU
  - the Limit is used in limiting the number of values returned and even the rows that you would want 
  - the limit should be the last command 
<img width="590" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/ecb5cf33-a8e5-4614-8381-585d8c4810ca">

- **DISTINCT ** THIS IS USED IN ACQUIRING UNIQUE ROWS. It is used in certain SQL fnctions because it consumes a lot of cpu
- -<img width="653" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/e2452c05-9c4c-47b2-86e2-275f5f97b264">

- - WHERE -- it is used to set a condition for the query
  - it also filters the queries
  - it always comes after the From statement
  - in commenting, (--)
  - multiline comment (/**/)
 
  - ORDER BY  -- after stating the command , you can state if you want it in acending or descending order  using the command ASC, DESC
  - <img width="175" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/ae7ab02e-ec3f-413d-956b-00473f758bf4">

## Comparison OPerators
- It is used within the Where and having clause
- It is used in conjuction with the comparison operators  ( = , <>, > , < , >= and <=)
- It is used in conjucntion with logical operators ( AND, OR, BETWEEN , IN )
- the <> operator means not, HOWEVER, you can use the NOT in WHERE to add the same conidtion
-  
