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

