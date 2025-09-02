-- Step 1: Creating Database: 
CREATE DATABASE airlines_data;

USE airlines_data;

-- Step 2: Creating Table
CREATE TABLE flight_data (
    ind INT,
    airline VARCHAR(50),
    flight VARCHAR(20),
    source_city VARCHAR(50),
    departure_time VARCHAR(20),
    stops VARCHAR(20),
    arrival_time VARCHAR(20),
    destination_city VARCHAR(50),
    class VARCHAR(20),
    duration FLOAT,
    days_left INT,
    price INT
);

-- Step 3: Load Data (MySQL)
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Airlines Flights Data.csv'
INTO TABLE flight_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- DATA CHECKING: 
SELECT
  COUNT(*),
  COUNT(ind),
  COUNT(airline),
  COUNT(flight) ,
  COUNT(source_city),
  COUNT(departure_time),
  COUNT(stops),
  COUNT(arrival_time),
  COUNT(destination_city),
  COUNT(class),
  COUNT(duration),
  COUNT(days_left), 
  COUNT(price)
FROM flight_data;
 --Result: Confirms No Null Values

-- STEP 5. EXPLORE THE DATA | Use SQL to answer:
--How many flights are in the dataset?
SELECT 
	COUNT(flight)
FROM 
    flight_data;

--What are the top 5 airlines by number of flights?
SELECT 
	airline,
	COUNT(flight)
FROM 
    flight_data
GROUP BY airline
ORDER BY 1 DESC;

--What are the most common source and destination cities?
SELECT city, SUM(total) AS total_flights
FROM (
  SELECT source_city AS city, COUNT(*) AS total
  FROM flight_data
  GROUP BY source_city
  UNION ALL
  SELECT destination_city AS city, COUNT(*) AS total
  FROM flight_data
  GROUP BY destination_city
) AS combined
GROUP BY city
ORDER BY total_flights DESC;

--Which departure time has the most contribution in Revenue?
SELECT 
    departure_time, 
    COUNT(*) AS flight_count
FROM flight_data
GROUP BY 1
ORDER BY flight_count DESC;

--Step 5. Data Cleaning
ALTER TABLE flight_data DROP ind;

-- Step 6. Revenue Analysis
--1. Sales: Which Airline has the Highest Sale in Total?
SELECT airline, SUM(price) AS total_sales
FROM flight_data
GROUP BY airline
ORDER BY total_sales DESC;

--2. Sales: Which airline earns the most from Economy vs Business class?
SELECT 
	airline,
    class,
    SUM(price) as total_sales
FROM flight_data
WHERE 
    class IN ('Economy', 'Business')
GROUP BY 
    airline, class
ORDER BY 
    class, total_sales DESC;

--3. Average ticket price per Airline
SELECT 
    airline, 
    ROUND(AVG(price), 2) as average_price
FROM flight_data
GROUP BY airline
ORDER BY average_price DESC;

--4. Which airline has the longest average flight duration?
SELECT 
    airline,
    AVG(duration) AS avg_flight_duration
FROM 
    flight_data
GROUP BY 
    airline
ORDER BY 
    avg_flight_duration DESC;

--Booking Behavior Insights:
SELECT 
    *,
    CASE
        WHEN days_left <= 3 THEN 'Last-Minute (0–3)'
        WHEN days_left <= 7 THEN 'Short-Term (4–7)'
        WHEN days_left <= 14 THEN 'Medium-Term (8–14)'
        WHEN days_left <= 30 THEN 'Planned (15–30)'
        ELSE 'Early Bird (31–49)'
    END AS DaysLeftGroup
FROM 
    flight_data;

--Managed the data for visualization in Power BI