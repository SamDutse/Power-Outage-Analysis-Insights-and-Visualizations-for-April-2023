# Power-Outage-Analysis-Insights-and-Visualizations-for-April-2023

**Introduction:**
In this project, I conducted an analysis of power outages using MS SQL. The objective was to gain insights into the power outage trends and patterns for the month of April 2023. By querying the [samdutse].[dbo].[Power_Outages_-_Zipcode] table, I extracted valuable information that sheds light on the impact and characteristics of these outages.

**Data Source:**
The data used for this analysis was sourced from the [samdutse].[dbo].[Power_Outages_-_Zipcode] table but gotten originally from kaggle. It contains information on power outages, including unique identifiers (uid), affected areas, number of outages, and timestamps (dt_stamp) indicating when the outages occurred.

**Findings:**
- Total number of power outages: In April 2023, there were a total of 53,336 power outages.
- Unique areas with outages: A total of 401 unique areas experienced power outages during the month.
- Top Five Areas: The top five areas with the highest number of outages were Area 21208, 21223, Area 21234, Area 21206, and Area 21204.
- Average outages per day: April 3rd had the highest average number of outages.
- Number of outages by month: The analysis focused solely on the month of April.
- Outage duration statistics: The minimum, maximum, and average duration of outages varied across different areas.
- Most recent power outages: The query returned the most recent power outages, providing insights into the latest disruptions and their respective areas.
- Number of outages during a specific date range: The analysis covered the period from April 1, 2023, to April 24, 2023.
- Number of outages by hour: The hourly breakdown showcased the distribution of outages throughout the day.

**Conclusion:**
The analysis of power outages in April 2023 provided valuable insights into the frequency, distribution, and duration of outages. These findings can help stakeholders identify areas for infrastructure improvements, enhance monitoring and response mechanisms, and invest in resilience measures. By addressing the challenges highlighted by the analysis, we can work towards a more reliable and resilient power infrastructure.

**Code Snippets:**
Here are the code snippets of the SQL queries used:

```sql
-- Query 1: Total number of power outages
SELECT COUNT(*) AS total_outages
FROM [samdutse].[dbo].[Power_Outages_-_Zipcode]

-- Query 2: Unique areas with outages
SELECT COUNT(DISTINCT area) AS Unique_Area_With_Outages
FROM [samdutse].[dbo].[Power_Outages_-_Zipcode]

-- Query 3: Top five areas with the highest number of outages
SELECT TOP 5 area, COUNT(*) AS num_outages
FROM [samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY area
ORDER BY num_outages DESC

-- Query 4: Average number of outages per day
SELECT CAST(dt_stamp AS date) AS outage_date, COUNT(*) AS num_outages
FROM [samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY dt_stamp
ORDER BY num_outages DESC

-- Query 5: Number of outages by hour
SELECT DATEPART(HOUR, dt_stamp) AS outage_hour, COUNT(*) AS num_outages
FROM [samdutse].[dbo].[Power_Outages_-_Zipcode]
GROUP BY DATEPART(HOUR, dt_stamp)
ORDER BY outage_hour DESC
```
