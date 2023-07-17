/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [uid]
      ,[area]
      ,[outages]
      ,[dt_stamp]
  FROM [samdutse].[dbo].[Power_Outages_-_Zipcode]

-- Total number of power outages:
SELECT 
	COUNT(*) AS total_outages
FROM
	[samdutse].[dbo].[Power_Outages_-_Zipcode] -- there area total of 53,336 outages

-- count of UNIQUE area's with outages
SELECT
	COUNT(DISTINCT(area)) AS Unique_Area_With_Outages
FROM
	[samdutse].[dbo].[Power_Outages_-_Zipcode]; -- 401 area are uniquely represented

-- Number of outages per area:
SELECT
	area, 
	COUNT(*) AS num_outages
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY 
	area
ORDER BY num_outages DESC; -- the area with most outage is Area 21208 with 846 outages

-- Most affected areas with the highest number of outages:
SELECT TOP 5
	area, 
	COUNT(*) AS num_outages
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY 
	area
ORDER BY 
	num_outages DESC;

-- Average number of outages per day:
SELECT 
	CAST(dt_stamp AS date) AS outage_date, 
	COUNT(*) AS num_outages
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY 
	dt_stamp
ORDER BY
	num_outages DESC;
-- 2023-04-03 has the highest average outage 

-- Number of outages by month:
SELECT 
	DATEPART(MONTH, dt_stamp) AS outage_month, 
	COUNT(*) AS num_outages
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY 
	DATEPART(MONTH, dt_stamp);
-- the data is just for the month of April

-- Outage duration statistics:
SELECT 
	area, 
	MIN(outages) AS min_duration, 
	MAX(outages) AS max_duration, 
	AVG(outages) AS average_duration
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY 
	area
ORDER BY
	average_duration;

-- Most recent power outages:
SELECT 
	area, 
	outages, 
	dt_stamp
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
ORDER BY 
	dt_stamp DESC;

-- Number of outages during specific date range:
SELECT 
	COUNT(*) AS num_outages
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
WHERE 
	dt_stamp >= '2023-01-01' AND dt_stamp <= '2023-06-01';

-- Number of outages by hour:
SELECT 
	DATEPART(HOUR, dt_stamp) AS outage_hour, 
	COUNT(*) AS num_outages
FROM 
	[samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY 
	DATEPART(HOUR, dt_stamp)
ORDER BY
	outage_hour DESC;

-- Date conversion
WITH Date_Converted AS
	(SELECT
		CAST(dt_stamp AS date) AS DT
	FROM
		[samdutse].[dbo].[Power_Outages_-_Zipcode])
SELECT 
	*
FROM 
	Date_Converted