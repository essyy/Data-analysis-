# Relational databases 

-Database normalization is the process of structuring a relational database in accordance with a series of so-called normal forms in order to reduce data redundancy and improve data integrity
- Separation of tables is called normalization
- Keeping the customer order and customer infromation would make it bloated and redundant and difficult to maintain
-<img width="404" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/54b5eb25-fe8d-471b-8129-16ec41b04a53">
- Storing data in this way is not a good choice
- It is better to store it in tables with diff tables
- There is need to separate tables because you only update the address in one place
## Types of Databases
- Many companies and organizations have created their own relational database software(DBMS)
- SQLITE - stores db in file
- Nosql  stands for not only sql . It describes BigData platforms that may leverage SQL but are not relational
- No sql include: MongoDB, Apache Cassandra and Redis
- These store massive amounts of data in a variety of raw and unstructured formats
- Most of these solutions are distributed across multuiple channels which is diff to do in relational db
- Other big data solutions such as Apache Hadoop can be interacted with SQL but unimited to relational db
- <img width="383" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/b9db0408-9947-4822-a77e-8c14e64256f7">
-Formal structure use SQL , If multiple people need to interact with teh db use a database
- <img width="386" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/5fa3f71a-439a-47fe-b656-ac6bcf1beee3">
- <img width="270" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/bc38642c-51e7-48b8-9599-0680e93e414a">
## databases
- The centralized db - server and a client
- lighweight db - When you want a simple solution for a small number of users, lightweight
databases are a great place to start
• They store data in a file that can be shared, but can break down when edited
simultaneously
  ## Excercise

  
REXON _Metals database
/*
1.SELECTING THE WHOLE DB
SELECT * FROM CUSTOMER
NEXT TASK  SELECT the ORDER_ID and SHIP_DATE fields from the CUSTOMER_OR
SELECT ORDER_ID, SHIP_DATE
FROM CUSTOMER_ORDER;
SELECT the PRODUCT_ID, DESCRIPTION, and a REDUCED_PRICE (which subtracts $1.10 from each PRICE) from
the PRODUCT table
SELECT  PRODUCT_ID, 
DESCRIPTION,
PRICE - 1.10 AS REDUCED_PRICE
FROM  PRODUCT;

*/
/*
Use of Inner join 
SELECT CUSTOMER_ID, NAME, ORDER_DATE
FROM CUSTOMER
INNER JOIN CUSTOMER_ORDER 
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID; 
*/
### WEather station DB
SELECT * 
FROM STATION_DATA
WHERE YEAR <> 2010
ORDER BY STATION_NUMBER ASC;
<img width="566" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/5fae61b0-64a1-4a0b-8d62-d5f5b4283a49">
## The code is used to check the specific months given youcan use OR or IN
SELECT * 
FROM STATION_DATA
WHERE MONTH IN (3, 6,9, 12)

<img width="754" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/d67d229d-3627-4b35-a514-b3419cff30d7">
/* Working with str*/
SELECT *
FROM station_data
WHERE report_code = '513A63'

<img width="954" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/d6e7f862-b47b-4875-9066-301396b9a88a">

USE OF LIKE
SELECT *
FROM station_data
WHERE report_code LIKE 'B_C%'

<img width="334" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/c9954826-59bf-4768-a110-b012114cf105">
# New term REGEXP
 ## MySQL supports another type of pattern matching operation based on the regular expressions and the REGEXP operator.

## It provide a powerful and flexible pattern match that can help us implement power search utilities for our database systems.
## REGEXP is the operator used when performing regular expression pattern matches. RLIKE is the synonym.
## It also supports a number of metacharacters which allow more flexibility and control when performing pattern matching.
## The backslash is used as an escape character. It’s only considered in the pattern match if double backslashes have used.
Not case sensitive.
Pattern	What the Pattern matches
*	Zero or more instances of string preceding it
+	One or more instances of strings preceding it
.	Any single character
?	Match zero or one instances of the strings preceding it.
^	caret(^) matches Beginning of string
$	End of string
[abc]	Any character listed between the square brackets
[^abc]	Any character not listed between the square brackets
[A-Z]	match any upper case letter.
[a-z]	match any lower case letter
[0-9]	match any digit from 0 through to 9.
[[:<:]]	matches the beginning of words.
[[:>:]]	matches the end of words.
[:class:]	matches a character class i.e. [:alpha:] to match letters, [:space:] to match white space, [:punct:] is match punctuations and [:upper:] for upper class letters.
p1|p2|p3	Alternation; matches any of the patterns p1, p2, or p3
{n}	n instances of preceding element
{m,n}	m through n instances of preceding element
## NULL VALUES
- SELECT report_code, precipitation 
FROM STATION_DATA
WHERE precipitation IS NULL;

<img width="508" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/f3b611da-8788-4f2d-8603-8cf752c4e214">

## COALESCE is used in converting null vales to zero 
<img width="478" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/3a489bc7-63c3-4968-b0d5-66aeb90d5fe2">
## Coalesce can only be used to convert the null values to 0
- to check the rows that are NUll you have to use the group by and order by command

## Group By 

<img width="653" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/2cda87d7-2339-4325-943b-f95cea9b5715">

## ORDER BY 
- Dont assume the syntax will be output in ascending order use it to organize data
-
- <img width="330" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/345d1bf2-6f8b-4ed3-ad63-decae1dcee14">
SELECT year, 
SUM(snow_depth) AS total_snow,
SUM(precipitation) AS total_precipitation,
MAX(precipitation) AS max_precipiation
  
FROM station_data
WHERE year >= 2005
GROUP BY year
<img width="305" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/2f76522f-8dbc-4866-8ee0-cabfea9507c7">
- WHERE DOES not support aggregate functions/ values
thus if where is used in place of having a function
<img width="283" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/ae53938d-0c40-4019-ad2d-800e9078455f">
- there is an error if where is used
nect code
/* Working with str*/
SELECT year, tornado,
SUM(precipitation) AS total_precipitation
  
FROM station_data
GROUP BY year
HAVING tornado
ORDER BY year DESC ;

<img width="229" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/99f063e9-015a-4e31-82b6-06142c87c3db">
## Continuation , Use of cases
SELECT year , month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS non_torndao_precipitation
FROM STATION_DATA
WHERE year >= 1990
GROUP BY year, month;
<img width="761" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/7218a7fa-96d6-4c6f-aaf9-43e234681167">
-Get the average temperature grouped by quarter and year, where a “quarter” is “Q1”, “Q2”, “Q3”, or “Q4”
reflecting months 1-3, 4-6, 7-9, and 10-12 respectively. 
<img width="761" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/a0c5a404-8fc0-4ee5-a0c7-fbb7a51715cb">
SELECT report_code, year,
CASE 
WHEN month >= 1 and month <= 3 THEN 'Q1' 
WHEN month >=4 and month <= 6 THEN 'Q2' 
WHEN month >=7 AND month <= 9 THEN 'Q3'
ELSE 'Q4' end as quarter 
from STATION_DATA
GROUP BY year, quarter;
One can also use 1, 2 which represents the two conditions which is year and quarter 

<img width="137" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/e3d2c443-4ead-4e33-94c1-d51251f4e7d5">
##  Parent / Child tables
<img width="344" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/f6d8b5d0-11ea-49e6-94fa-88bf5db33934">
- Parent supplies data the child receives the data 
- The parent has the primary key while the foreign key is the child key. The primary key is the unique ID 

- Inner join
- SELECT CUSTOMER.CUSTOMER_ID,
CUSTOMER_ORDER.CUSTOMER_ID,
name, order_id,
ship_date,
street_address,city,
state,
zip,
product_id,
order_qty
FROM CUSTOMER
INNER JOIN CUSTOMER_ORDER ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
<img width="953" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/b3f97844-1e67-42e6-9408-fc039fc44dd4">
## This syntax is similar to join syntax but is not recommended 

<img width="339" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/7daf96c1-a62a-41f0-b776-080ad71daf8b">
# *** NOT recommended
## Left Join 
SELECT CUSTOMER.CUSTOMER_ID,
CUSTOMER_ORDER.CUSTOMER_ID,
name, order_id,
ship_date,
street_address,city,
state,
zip,
product_id,
order_qty
FROM CUSTOMER
LEFT JOIN CUSTOMER_ORDER ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID

<img width="958" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/9ca1ec7c-b6d0-4a87-94dd-3d1041b973b4">


### to check null values


;
1
SELECT CUSTOMER.CUSTOMER_ID,
2
CUSTOMER_ORDER.CUSTOMER_ID,
3
name, order_id,
4
ship_date,
5
street_address,city,
6
state,
7
zip,
8
product_id,
9
order_qty
10
FROM CUSTOMER
11
LEFT JOIN CUSTOMER_ORDER ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
12
WHERE order_id ISNULL;
SELECT CUSTOMER.CUSTOMER_ID,
CUSTOMER_ORDER.CUSTOMER_ID,
name, order_id,
ship_date,
street_address,city,
state,
zip,
product_id,
order_qty
FROM CUSTOMER
LEFT JOIN CUSTOMER_ORDER ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
WHERE order_id ISNULL;
<img width="685" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/17eae7ea-743c-41e8-af3f-4b0d10a8ba60">
- The left table is the one that is used the one after on is the right one
- Joining Multiple Tables
- SELECT 
order_id,
CUSTOMER.CUSTOMER_ID,
CUSTOMER_ORDER.CUSTOMER_ID,
name AS Customer_name, 
street_address,
city,
state,
zip,
product.product_id,
description,
order_qty
FROM CUSTOMER
INNER JOIN CUSTOMER_ORDER ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
INNER JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID
<img width="959" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/00a05978-84cc-4b86-ab43-da061b65e390">
### Remember to use the Alias if you want to name tables
-- uSE OF left join

SELECT 
order_id,
CUSTOMER.CUSTOMER_ID,
CUSTOMER_ORDER.CUSTOMER_ID,
COALESCE(SUM(order_qty * price), 0) AS TOTAL_REVENUE
FROM CUSTOMER
LEFT JOIN CUSTOMER_ORDER ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
LEFT JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID

GROUP by 1, 2

The COALESCE is used to convert null values to 0 
<img width="571" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/892ef393-61fe-4a65-a286-38864507ebf0">
Task 7

<img width="395" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/3e5ee770-c648-41ca-944a-f1bcd3fc393a">
SELECT 
order_id,
order_date,
description,
CUSTOMER_ORDER.PRODUCT_ID,
PRODUCT.PRODUCT_ID

FROM CUSTOMER_ORDER
INNER JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID

GROUP by 1, 2;

<img width="947" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/d1bbe28e-c951-4fbe-a9fe-bc2d61f5a6d9">

Task 8 

<img width="404" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/47ea20b5-731c-4839-ab56-8147a64c576f">
SELECT 
description,
CUSTOMER_ORDER.PRODUCT_ID,
PRODUCT.PRODUCT_ID,
(price * order_qty) As Total_Revenue
FROM CUSTOMER_ORDER
LEFT JOIN PRODUCT
ON PRODUCT.PRODUCT_ID = CUSTOMER_ORDER.PRODUCT_ID

GROUP by 1, 2;
<img width="953" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/c461d25d-bed4-40fb-8ff5-170dd1b9365f">
Solution 2 
<img width="302" alt="image" src="https://github.com/essyy/Data-analysis-/assets/54889306/b65746ff-c4bb-452e-b2c2-456fd7143ccb">
### Planning a DB
1. Carry out data questions - how much data will be populated into the tables, where is it coming from?who will be responsible?, is there need to automate the tables
2. Security qns - who has access, beware of SQL injection. Dont concatenate strings. *** Check on how to use python and sql together
3. 3min_datascience ()
IN transactions, by stating END transactions enables one to undo using ROLLBACK
-- Indicies -- slow down the code
