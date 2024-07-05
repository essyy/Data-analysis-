Introduction to SQL USING ORILLEY

Database is where structured data is stored
Database management Software is used to run commands needed in the db
A table is where the data is specifically stored
Columns are specific parts of the data(First name, contact etc)
When a table is created, each column is unique(datatype, name)
Rows - individual data added to the folder
Relational Database - data management thats stored the data in specific tables and relates them together
Keys are used in relational tables. They include: 
Primary key - uniquely identify each and every row and foreign key is used to connect the data in one table to the next.



DBMS fal into two: client-server(Mysql, Oracle or shared file(Access, filemaker)

Command prompts
SELECT  - retrieve data
DISTINCT - return distinct values
LIMIT
Syntax
Whitesoace is ignored by SQL
Terminate Statements are important in terminating the statements
SQL is case sensitive especially the names of the tables, ensure it is consistent to ensure ease of understanding 
Comments: – or /* */


Sort retrieved Data
There is : 
ORDER BY - the column to sort by 

In using the ORDER BY command, dont state ORDER BY 2,3 etc The issue is with adding extra columns, this may have an issue always provide an explicit order.
You can have as many columns with the ORDER BY command

### Filter data
This is done using Where It has to come before ORDER BY and after FROM
Where can be used with clause operators ie =, !=, <>, <=, 
If there are strings, they have to be in quotes 
Different DBMS rn the commands on decimal spaces 
### Filtering data using a Range
One can use BETWEEN , AND 
### Filtering for no value -
This means that the empty column is a NULL column 
NULL is not same as “””
IS NULL - checks all that are null
### Advanced Filtering 
There is use of WHERE, IN and NOT 
Combine WHERE clauses : AND (Both must be true), OR (one can be true)
Combination of AND , OR commands - Order evaluation - it processes AND before the OR You can use the brackets to enable the OR command to be viewed first. The order is (), AND, OR 
Always use parenthesis if you want one to go ahead of the other 
#### Filter using In
It is similar to OR 
It makes the option of using OR less thus less commands
NOT is used in negating where
Examples: 
WHERE NOT . This is equivalent to <> or !=
### Wildcard Filtering 
Partial test to check for a partial match – examples: LIKE
% TO match zero or more characters 
_ to match a single character 
[] to match one of a list of specified characters
[^] to negate the match 
[] is not widely supported
Example: ‘Fish%’ – word in  the beginning should be fish 
You can negate the LIKE using not or ^ n the character 
If you are unsure of the db , and you want the use of LIKE you can tye it with a % at the end
Do not over use wildcards because they take lots of time to execute
Also, use wildcard for LIKE searches 
Wilddcards should not be used at a start of a search
### Create Calculated Fields
Calculated field is generated 
Concatenation - used to append columns to each other


### Aliases
They are used in naming a column 
Used in naming the results in the mathematical calculations
### String Functions
LEFT(), RIGHT() to extract parts of a string 
LENGTH() to obtain length of the string
LOWER() & UPPER() to convert string to case
TRIM, LTRIM() AND RTRIM to trim things
SOUNDEX is used to convert the string to a specific value
### Working with date
They rae used to extract parts o dates and times, compare date and time values and format date and times to locate details

Summary 
### Aggregate Functions 
They are used to generate results they include: avg, count, max, min, sum 
Count - total number of rows with the condition given 
Max can return the highest value with min being the opposite
### Grouping data
A group is a unique column name
Group by must come first before order by 
most dbms is will not let you Group by variable and columns. These are columns that store things like notes and memos of variable length. You typically cannot group buy those
HAVING functions similar to group by level as opposed to where which searches at a row level 



Where filters before data is grouped while having filters after 
The syntax for adding where is 

### Subqueries
A way to pass a query to the where clause
Use of WHERE AND IN to pass a statement 

This is a nested query





They can be used a sub calculated fields

### JOINS
Tables are joined by keys
Pry key identifies every row in a table
Foreign key contains the primary key value of a related table 
Multiple rows can have he same foreign key 
To join this , use an INNER JOIN OR EQUI JOIN 




Joining multiple tables

### Aliases 

It is important to use aliases in self join
SElf join - join within a tabl;e and itself

EQUIJOIN/INNER JOIN - joins two tables and only retrieves rows that have related rows in one table



The left anything on the left should be displayed the other table should on the right with a relation
FULL OUTER JOIN 
One will use agregate functions with the joins

## SYNTAX 

Summary for this 

### uNION JOINS TWO SQL statements
OR can also be used to do this
Union removes duplicates
If you state Union ALL it prints all the rows that match the sql syntax
Combined union can only have one ORDER BY Command





### Inserting Data
Explicitly list the details the column  then into values 
Insert select 

### Copy to another table



### Update data 
It is easy to update and delete and there is no undo row
UPDATE , SET - value pairs with the columns  to be updated
You should specify the WHERE TO avoid the deletion of the important data
### Delete is the same as Update
Use WHERE clause has the same importance
Foreign keys are important in blocking rows that are still in use and thus will protect the data 

Finalising 

The code depends on the DBMS



### Views




### Triggers 
They are blocks of sql code that are automatically executed when an event occurs
It is used in the Data manipulation syntax – UPDATE 
Can be used for ensuring data consistency, integrity validation and archiving
They are tied to tables
Cursors - they provide a way to loop through and process rows one at a time. They can be used for reporting, per row calculations
Transactions - provide a way to define a block of SQL that has to be executed completely or not at all 
Transactions block provides a way to roll back to block partial data 
Constraints - rules added in a table to ensure data integrity and consistency 


