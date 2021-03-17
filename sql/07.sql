/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
SELECT first_name || ' ' || last_name AS "Actor Name"
FROM (
    SELECT DISTINCT actor_id
    FROM film_actor
    WHERE film_id IN (
        SELECT film_id
        FROM film_actor
        WHERE actor_id IN (
            SELECT actor_id
            FROM (SELECT DISTINCT actor_id
                FROM film_actor
                WHERE film_id IN (SELECT film_id
                            FROM film_actor
                            WHERE actor_id = 112)) t 
            WHERE actor_id != 112)
    )) sub
INNER JOIN actor USING (actor_id)
WHERE actor_id NOT IN (
    SELECT actor_id
    FROM (SELECT DISTINCT actor_id
        FROM film_actor
        WHERE film_id IN (SELECT film_id
                  FROM film_actor
                  WHERE actor_id = 112)) t)
ORDER BY "Actor Name";




