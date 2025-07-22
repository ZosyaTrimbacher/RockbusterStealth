This query performs descriptive statistics on several columns of the film table

SELECT 
    MIN(rental_rate) AS min_rent,
    MAX(rental_rate) AS max_rent,
    AVG(rental_rate) AS avg_rent,
    COUNT(rental_rate) AS count_rent_values,

    MIN(release_year) AS earliest_released_year,
    MAX(release_year) AS latest_released_year,
    AVG(release_year) AS average_released_year,
    COUNT(release_year) AS count_released_year,

    MIN(rental_duration) AS minimum_rental_duration,
    MAX(rental_duration) AS maximum_rental_duration,
    AVG(rental_duration) AS average_rental_duration,
    COUNT(rental_duration) AS count_rental_duration,

    MIN(length) AS minimum_film_length,
    MAX(length) AS maximum_film_length,
    AVG(length) AS average_film_length,
    COUNT(length) AS count_film_length,

    MIN(replacement_cost) AS minimum_replacement_cost,
    MAX(replacement_cost) AS maximum_replacement_cost,
    AVG(replacement_cost) AS average_replacement_cost,
    COUNT(replacement_cost) AS count_replacement_cost,

    COUNT(*) AS count_rows
FROM film;
 

