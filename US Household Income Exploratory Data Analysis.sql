SELECT * FROM ushouseholdincome;

SELECT * FROM ushouseholdincome_statistics;

SELECT state_name, SUM(aland), SUM(awater)
FROM ushouseholdincome
GROUP BY 1
ORDER BY 2 DESC
LIMIT  10
;

SELECT state_name, SUM(aland), SUM(awater)
FROM ushouseholdincome
GROUP BY 1
ORDER BY 3 DESC
LIMIT  10
;

SELECT * FROM ushouseholdincome u 
JOIN ushouseholdincome_statistics us 
ON us.id = us.id
WHERE mean <>0;

SELECT u.state_name, county, type, `primary`, mean, median FROM ushouseholdincome u 
JOIN ushouseholdincome_statistics us 
ON us.id = us.id
WHERE mean <>0;

SELECT u.state_name, ROUND(AVG(mean), 1), ROUND(AVG(median), 1) 
FROM us_household_income.ushouseholdincome u
INNER JOIN us_household_income.ushouseholdincome_statistics us 
ON u.id = us.id
WHERE mean <>0
GROUP BY 1
ORDER BY 2
LIMIT 5;

SELECT u.state_name, city, ROUND(AVG(mean), 1), ROUND(AVG(median), 1)
FROM us_household_income.ushouseholdincome u
JOIN us_household_income.ushouseholdincome_statistics us
ON u.id = us.id
GROUP by 1 , 2
ORDER BY 3 DESC;
