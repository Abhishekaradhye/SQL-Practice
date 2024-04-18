# Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT *  from CITY where COUNTRYCODE = 'USA' AND POPULATION > 100000;

# Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

# Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.M 
SELECT DISTINCT NAMES FROM STATION WHERE ID % 2 = 0; 

# Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(*) - COUNT(DISTINCT CITY) AS DIFFERENCE FROM STATION;

# Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
#(i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first 
#when ordered alphabetically.
(SELECT CITY, length(CITY) AS city_length FROM STATION
ORDER BY city_length ASC, CITY ASC LIMIT 1)
UNION 
(SELECT CITY, length(CITY) AS city_length FROM STATION
ORDER BY city_length DESC, CITY ASC LIMIT 1);

# Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT CITY FROM STATION WHERE left(CITY, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');

# Write a solution to find all customers who never order anything. 2 tables are given. Customers table has columns id and name. 
#Orders table has columns id and customer_id. 

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

# Find the player(s) with the highest wickets taken among players who have played more than 100 matches and 
#the name of the player must contain "ra".

SELECT player_name, wickets_taken
FROM CricketPlayer
WHERE matches_played > 100
AND player_name LIKE '%ra%'
ORDER BY wickets_taken DESC LIMIT 1;

# Write a solution to report all the duplicate emails. No entry in email is null
SELECT email as Email from Person 
GROUP BY email
HAVING COUNT(email) > 1;


# Report for every three line segments whether they can form a triangle.
'''Triangle table:
| x  | y  | z  |
| 13 | 15 | 30 |
| 10 | 20 | 15 | '''

SELECT x, y, z,
    CASE
        WHEN x + y > z AND y + z > x AND x + z > y THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;
