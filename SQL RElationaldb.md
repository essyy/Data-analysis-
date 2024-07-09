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
