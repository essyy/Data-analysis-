/* The aim is to carry out 
1. Exploratory data analysis
2Feature engineering 
3. Segmentation 
4. Segment Profiling
*/
--create table
CREATE TABLE "Nexa_Sat".nexa_sat(
	Customer_id VARCHAR(50),
	gender Varchar(10),
	Partner VARCHAR(3),
	Dependents VARCHAR(3),
	Senior_Citizen INT,
	Call_Duration FLOAT,
	Data_Usage FLOAT,
	Plan_Type VARCHAR(20),
	Plan_Level VARCHAR(20),
	Monthly_Bill_Amount FLOAT,
	Tenure_Months INT,
	Multiple_Lines VARCHAR(3),
	Tech_Support VARCHAR(3),
	Churn INT);
-- confirm current schema
SELECT current_schema();

--set path for queries  to avoid using "Nexa_Sat".nexa_sat
SET Search_path TO "Nexa_Sat";

--view data The set path enables one to access the dir easier
SELECT * 
FROM nexa_sat;
-- data cleaning by searching for dupes
SELECT customer_id,gender,partner,dependents,
	senior_citizen,call_duration, data_usage,plan_type,
	plan_level,monthly_bill_amount,tenure_months, multiple_lines,tech_support,churn
FROM nexa_sat
GROUP BY customer_id,gender,partner,dependents,
	senior_citizen,call_duration, data_usage,plan_type,
	plan_level,monthly_bill_amount,tenure_months, multiple_lines,tech_support,churn
HAVING COUNT(*) >1; -- there is no dupes
--check for null values
SELECT * 
FROM nexa_sat
WHERE customer_id ISNULL
OR gender ISNULL
OR PARTNER ISNULL
OR dependents ISNULL
OR senior_citizen ISNULL
OR call_duration ISNULL
OR data_usage ISNULL
OR plan_type ISNULL
OR plan_level ISNULL
OR monthly_bill_amount ISNULL
OR tenure_months ISNULL
OR multiple_lines ISNULL
OR tech_support ISNULL
OR churn ISNULL

-- Explorative Data Analysis
--how many users 
SELECT COUNT(customer_id) AS total_number 
FROM nexa_sat
WHERE churn = 0;
-- totl number of usres by plan level
SELECT plan_level, COUNT(CUSTOMER_ID) AS total_users
FROM nexa_sat
WHERE churn = 0
GROUP BY plan_level;
-- calculate the total revenue
SELECT ROUND(SUM(monthly_bill_amount::numeric),2) AS Revenue
FROM nexa_sat;
-- cast the data as a numeric 
-- revenue by plan level

SELECT plan_level, ROUND(SUM(monthly_bill_amount::numeric),2) AS revenue 
FROM nexa_sat
GROUP BY 1
--GROUP BY 2;
--churn count by plan type and plan level
SELECT plan_level, plan_type,
	COUNT(*) AS total_customers,
	SUM(CHURN) As churn_count
FROM nexa_sat
GROUP BY 1,2
ORDER BY 1
-- AVERAGE TENURE BY PLAN LEVEL
SELECT plan_level, ROUND(AVG(tenure_months),2) AS avg_tenure
FROM nexa_sat
GROUP BY 1;
-- sEGMENTATION OF data
--create table of only existing users
CREATE TABLE existing_users AS
SELECT * 
FROM nexa_sat 
WHERE churn = 0;
-- 
SELECT * 
FROM existing_users
-- CALCULATE THE AVERAGE REVENUE per user
SELECT ROUND(AVG(monthly_bill_amount:: INT),2) AS ARPUT
FROM existing_users;
-- calculation of clv 
ALTER TABLE existing_users 
ADD COLUMN clv FLOAT;

UPDATE existing_users
SET clv = monthly_bill_amount + tenure_months;

SELECT customer_id, clv
FROM existing_users;

--clv score
--monthly_bill = 40% and the tenure should be 30% ,
--call_duration - 10% 
ALTER TABLE existing_users
ADD COLUMN clv_score NUMERIC(10,2);

UPDATE existing_users
SET clv_score = (0.4* monthly_bill_amount)+
				(0.3 * tenure_months) +
				(0.1 * call_duration) +
				(0.1 * data_usage) +
				(0.1 * CASE WHEN plan_level = 'Premium'
							THEN 1 ELSE 0
							END);
-- VIEW THE file
SELECT customer_id, clv_score
FROM existing_users;

-- group the users based on the scores
ALTER TABLE existing_users
ADD COLUMN clv_segments VARCHAR;

UPDATE existing_users 
SET	clv_segments = 
			CASE WHEN clv_score > (SELECT percentile_cont(0.85)
										WITHIN GROUP (ORDER BY clv_score)
										FROM existing_users) THEN 'High Value'
					WHEN clv_score >= (SELECT percentile_cont(0.50)
										WITHIN GROUP(ORDER BY clv_score)
											FROM existing_users) THEN 'Moderate values'
					WHEN clv_score >= (SELECT percentile_cont(0.25)
										WITHIN GROUP (ORDER BY clv_score)
											FROM existing_users) THEN 'Low_Value'
					ELSE 'Churn Risk'
					END;
-- VIEW SEGMENTS
SELECT customer_id, clv, clv_score, clv_segments
FROM existing_users;
-- Analyze the segments
--avg bill and tenure per segment 
SELECT clv_segements,
	ROUND(AVG(monthly_bill_amount::INT),2) AS avg_monthly_charges,

FROM existing_users


--tech support and multiple lines count 
SELECT clv_segments,
	ROUND(AVG(CASE WHEN tech_support = 'Yes' THEN 1 ELSE 0 END),2) AS tech_support_pct,
	ROUND(AVG(CASE WHEN multiple_lines = 'Yes' THEN 1 ELSE 0 END),2) AS multiple_line_pct
FROM existing_users
GROUP BY 1;

-- Revenue per segment 
SELECT clv_segments, COUNT(customer_id),
	CAST(SUM(monthly_bill_amount * tenure_months) AS NUMERIC(10,2)) AS total_revenue  
FROM existing_users
GROUP BY 1;



--cross selling and Up selling
--selling an additional 
SELECT customer_id
FROM existing_users
WHERE senior_citizen = 1
AND dependents = 'NO'
AND tech_support = 'NO'
AND (clv_segments = 'Churn Risk' OR clv_segments = 'Low Value');

-- cross-selling those that have multiple lines
SELECT customer_id
FROM existing_users
WHERE multiple_lines = 'No'
AND dependents = 'Yes' OR partner = 'Yes'
AND plan_level = 'Basic';

-- upselling to offer discount to churn users
SELECT customer_id
FROM existing_users
WHERE clv_segments = 'Churn Risk'
AND plan_level = 'Basic';

-- upselling - high and moderate users to have a prem package
SELECT plan_level, ROUND(AVG(monthly_bill_amount::INT),2),
	ROUND(AVG(tenure_months::INT),2)
FROM existing_users
WHERE clv_segments = 'High Value'
OR clv_segments = 'Moderate Value'
GROUP BY 1;

--select customer
SELECT customer_id, monthly_bill_amount
FROM existing_users
WHERE plan_level = 'Basic'
AND (clv_segments) = 'High Value' OR clv_segments = 'Moderate Value'
AND monthly_bill_amount >150;


--Create stored proceedures
-- automate the queries
--stored proceedures for snr citizens
CREATE FUNCTION tech_support_snr_citizens()
RETURNS TABLE(customer_id VARCHAR(50))
AS $$
BEGIN
	RETURN QUERY
	SELECT eu.customer_id
	FROM existing_users eu
	WHERE eu.senior_citizen = 1 
	AND eu.dependents = 'No'
	AND eu.tech_support = 'No'
AND (eu.clv_segments = 'Churn Risk' OR clv_segments = 'Low Value');
END;
$$ LANGUAGE plpgsql;

-- Create function Churn risk Discount
CREATE FUNCTION churn_risk_discount()
RETURNS TABLE (customer_id VARCHAR(50))
AS $$
BEGIN
	RETURN QUERY
	SELECT eu.customer_id
	FROM existing_users eu
	WHERE eu.clv_segments = 'Churn Risk'
	AND eu.plan_level = 'Basic';
END;
$$ LANGUAGE plpgsql

-- customers that will be given teh premium ugrade
CREATE FUNCTION high_usage_basic()
RETURNS TABLE (customer_id VARCHAR(50))
AS $$
BEGIN
	RETURN QUERY
	SELECT eu.customer_id
	FROM existing_users eu
	WHERE eu.plan_level = 'Basic'
	AND (eu.clv_segments) = 'High Value' OR eu.clv_segments = 'Moderate Value'
	AND eu.monthly_bill_amount >150;
END;
$$ LANGUAGE plpgsql;

-- USE PROCEEDURES
-- churn risk discount 
SELECT *
FROM churn_risk_discount();

--high usage basic 
SELECT *
FROM high_usage_basic();
