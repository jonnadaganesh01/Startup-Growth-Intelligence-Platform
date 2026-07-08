SELECT
    u.user_id,
    u.full_name,
    u.country,
    s.plan_name,
    s.amount,
    s.payment_status
FROM users u
INNER JOIN subscriptions s
ON u.user_id = s.user_id;

SELECT
    plan_name,
    COUNT(*) AS total_subscribers,
    SUM(amount) AS total_revenue
FROM subscriptions
GROUP BY plan_name
ORDER BY total_revenue DESC;



SELECT
    u.user_id,
    u.full_name,
    u.country
FROM users u
LEFT JOIN subscriptions s
ON u.user_id = s.user_id
WHERE s.subscription_id IS NULL;


SELECT
    device,
    ROUND(AVG(session_duration),2) AS avg_duration
FROM sessions
GROUP BY device
ORDER BY avg_duration DESC;

SELECT
    user_id,
    COUNT(*) AS total_sessions
FROM sessions
GROUP BY user_id
ORDER BY total_sessions DESC
LIMIT 10;

SELECT
    u.country,
    SUM(s.amount) AS revenue
FROM users u
JOIN subscriptions s
ON u.user_id=s.user_id
GROUP BY u.country
ORDER BY revenue DESC;

WITH revenue_cte AS
(
    SELECT
        plan_name,
        SUM(amount) AS revenue
    FROM subscriptions
    GROUP BY plan_name
)

SELECT *
FROM revenue_cte;

SELECT
    user_id,
    amount,
    RANK() OVER(ORDER BY amount DESC) AS revenue_rank
FROM subscriptions;

SELECT
    session_id,
    user_id,
    session_duration,
    ROW_NUMBER() OVER(
        ORDER BY session_duration DESC
    ) AS row_num
FROM sessions;

SELECT
    amount,
    DENSE_RANK() OVER (
        ORDER BY amount DESC
    ) AS amount_rank
FROM subscriptions;


SELECT
    subscription_id,
    amount,
    SUM(amount) OVER(
        ORDER BY subscription_id
    ) AS running_total
FROM subscriptions;

SELECT
    user_id,
    COUNT(*) AS total_sessions
FROM sessions
GROUP BY user_id
HAVING COUNT(*) > 5
ORDER BY total_sessions DESC;