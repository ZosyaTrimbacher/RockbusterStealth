SQL Query Refactoring with CTEs: Analyzing Top 5 Customer Distribution by Country
This query uses CTEs to first count all customers per country, then identify the top 5 highest-paying customers. 
It combines both to analyze how top spenders are distributed across countries, enabling a comparison between overall customer base and high-value customers.

WITH country_list AS (
    SELECT 
        country.country,
        COUNT(customer.customer_id) AS all_customer_count
    FROM customer
    INNER JOIN address ON customer.address_id = address.address_id
    INNER JOIN city ON address.city_id = city.city_id
    INNER JOIN country ON city.country_id = country.country_id
    GROUP BY country.country
),

top_5 AS (
    SELECT
        customer.customer_id,
        country.country
    FROM customer
    INNER JOIN payment ON customer.customer_id = payment.customer_id
    INNER JOIN address ON customer.address_id = address.address_id
    INNER JOIN city ON address.city_id = city.city_id
    INNER JOIN country ON city.country_id = country.country_id
    WHERE city.city IN (
        'Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule (Dhulia)',
        'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo'
    )
    AND country.country IN (
        'India', 'China', 'United States', 'Japan', 'Mexico',
        'Brazil', 'Russian Federation', 'Philippines', 'Turkey', 'Indonesia'
    )
    GROUP BY customer.customer_id, country.country
    ORDER BY SUM(payment.amount) DESC
    LIMIT 5
)

SELECT
    country_list.country,
    country_list.all_customer_count,
    COUNT(top_5.customer_id) AS top_customer_count
FROM country_list
LEFT JOIN top_5 ON country_list.country = top_5.country
GROUP BY country_list.country, country_list.all_customer_count
ORDER BY top_customer_count DESC;
