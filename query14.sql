-- QUESTION 
-- Determine the distribution of orders by hour of the day.


SELECT HOUR(ORDER_TIME) AS HOUR,COUNT(ORDER_ID) AS COUNT
  FROM ORDERS GROUP BY HOUR(ORDER_TIME); 
