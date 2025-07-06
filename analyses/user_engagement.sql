--Analysis: User Engagement (Number of rating per user)
SELECT
    user_id,
    COUNT(*) AS number_of_ratings,
    ROUND(AVG(rating),2) AS average_rating_given,
FROM {{ ref('fct_ratings') }}
GROUP BY user_id
ORDER BY number_of_ratings DESC;