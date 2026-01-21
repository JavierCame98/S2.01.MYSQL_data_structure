USE optica;


SELECT 
    sa.sale_date, 
    c.name AS Customer, 
    e.name AS Employee, 
    b.name AS Brand_Sold, 
    g.price
FROM sale sa
JOIN customer c ON sa.customer_id = c.customer_id
JOIN employee e ON sa.employee_id = e.employee_id
JOIN glasses g ON sa.glasses_id = g.glasses_id
JOIN brand b ON g.brand_id = b.brand_id;