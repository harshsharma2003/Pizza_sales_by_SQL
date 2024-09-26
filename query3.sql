-- QUESTION 3
-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    PIZZA_TYPES.NAME, SUM(ORDER_DETAILS.QUANTITY * PIZZAS.PRICE) AS REVENUE
FROM
    PIZZA_TYPES
        INNER JOIN
    PIZZAS ON PIZZA_TYPES.PIZZA_TYPE_ID = PIZZAS.PIZZA_TYPE_ID
        INNER JOIN
    ORDER_DETAILS ON ORDER_DETAILS.PIZZA_ID = PIZZAS.PIZZA_ID
GROUP BY PIZZA_TYPES.NAME
ORDER BY SUM(ORDER_DETAILS.QUANTITY * PIZZAS.PRICE) DESC
LIMIT 3;