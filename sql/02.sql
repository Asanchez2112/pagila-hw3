/*
 * Count the number of movies that contain each type of special feature.
 */

SELECT special_features,
       count(subquery.special_features)
FROM (SELECT unnest(special_features) AS special_features
      FROM film) AS subquery
GROUP BY special_features
ORDER BY special_features;
