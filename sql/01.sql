/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */

SELECT title
FROM (SELECT title, 
             rating,
             unnest(special_features) AS features
      FROM film) AS subquery
WHERE rating = 'G' AND features = 'Trailers'
ORDER BY title DESC;
