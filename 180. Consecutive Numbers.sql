# Write your MySQL query statement below
SELECT DISTINCT num as ConsecutiveNums
FROM (
    SELECT num, 
           LEAD(num, 1) OVER(ORDER BY id) AS next_num,
           LAG(num, 1) OVER(ORDER BY id) AS prev_num
    FROM Logs
) AS t
WHERE num = next_num AND num = prev_num;
