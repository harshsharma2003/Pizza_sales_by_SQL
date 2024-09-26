-- QUESTION 13
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
 
 
SELECT CATEGORY , NAME , REVENUE , RN 
FROM  
(SELECT CATEGORY , NAME, REVENUE,
 ROW_NUMBER() OVER ( PARTITION BY CATEGORY ORDER BY REVENUE DESC ) AS RN 
 FROM
 (SELECT PIZZA_TYPES.CATEGORY , PIZZA_TYPES.NAME ,
 ROUND(SUM(ORDER_DETAILS.QUANTITY * PIZZAS.PRICE),2) AS REVENUE
 FROM  PIZZA_TYPES 
INNER JOIN 
PIZZAS ON PIZZA_TYPES.PIZZA_TYPE_ID = PIZZAS.PIZZA_TYPE_ID 
INNER JOIN 
ORDER_DETAILS ON PIZZAS.PIZZA_ID = ORDER_DETAILS.PIZZA_ID 
 GROUP BY PIZZA_TYPES.CATEGORY, PIZZA_TYPES.NAME) AS A)AS B WHERE RN <4;
