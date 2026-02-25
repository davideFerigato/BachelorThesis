-- Supponendo che le tabelle 'orders' e 'customer' siano state create e popolate
CREATE MATERIALIZED VIEW mv_total_orders
    AUTO REFRESH YES  -- per avere un auto refresh
AS 
    SELECT c.cust_id, 
           c.first_name, 
           SUM(o.amount) AS total_amount 
    FROM orders o 
    JOIN customer c 
      ON c.cust_id = o.customer_id 
    GROUP BY c.cust_id, 
             c.first_name;