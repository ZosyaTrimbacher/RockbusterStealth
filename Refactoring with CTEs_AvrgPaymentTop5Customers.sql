SQL Query Refactoring with CTE: Calculating Average Payment of Top 5 Customers
This query identifies the top 5 customers by total payment using multiple INNER JOINs and filters, 
then calculates their average spending using a CTE for cleaner and modular SQL design.



WITH top_customers AS (
    SELECT 
        customer.customer_id, 
        customer.first_name, 
        customer.last_name,
        country.country, 
        city.city,
        SUM(payment.amount) AS total_amount
    FROM customer
    INNER JOIN payment ON customer.customer_id = payment.customer_id
    INNER JOIN address ON customer.address_id = address.address_id
    INNER JOIN city ON address.city_id = city.city_id
    INNER JOIN country ON city.country_id = country.country_id
    WHERE city.city IN (
        'Aurora', 'Atlixco', 'Xintai', 'Adoni',
        'Dhule (Dhulia)', 'Kurashiki', 'Pingxiang', 'Sivas',
        'Celaya', 'So Leopoldo'
    )
    AND country.country IN (
        'India', 'China', 'United States',
        'Japan', 'Mexico', 'Brazil', 'Russian Federation',
        'Philippines', 'Turkey', 'Indonesia'
    )
    GROUP BY 
        customer.customer_id, 
        customer.first_name, 
        customer.last_name,
        country.country, 
        city.city
    ORDER BY total_amount DESC
    LIMIT 5
)

SELECT 
    AVG(total_amount) AS average_paid_by_top_5_customers
FROM top_customers;
 

