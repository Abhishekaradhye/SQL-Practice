'''
Write a solution to find the nth highest salary from the Employee table. If there is no nth highest salary, return null.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
'''

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE result INT;
  SET result = (
      SELECT salary
      FROM (
          SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
          FROM Employee
      ) ranked
      WHERE rnk = N
  );
  RETURN result;
END;

