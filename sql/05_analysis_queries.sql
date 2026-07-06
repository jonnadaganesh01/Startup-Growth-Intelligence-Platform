SELECT
    country,
    COUNT(*) AS total_users
FROM users
GROUP BY country
ORDER BY total_users DESC;


-- Query 2: Active vs Inactive Users

SELECT
    account_status,
    COUNT(*) AS total_users
FROM users
GROUP BY account_status;

-- Query 3: Users by Subscription Plan

SELECT
    subscription_plan,
    COUNT(*) AS total_users
FROM users
GROUP BY subscription_plan
ORDER BY total_users DESC;

-- Query 4: Users by Device

SELECT
    device_type,
    COUNT(*) AS total_users
FROM users
GROUP BY device_type
ORDER BY total_users DESC;

-- Query 5: Premium Users by Country

SELECT
    country,
    COUNT(*) AS premium_users
FROM users
WHERE subscription_plan = 'Premium'
GROUP BY country
ORDER BY premium_users DESC;

-- Query 6: Sessions by Browser

SELECT
    browser,
    COUNT(*) AS total_sessions
FROM sessions
GROUP BY browser
ORDER BY total_sessions DESC;

-- Query 7: Average Session Duration

SELECT
    ROUND(AVG(session_duration),2) AS avg_session_minutes
FROM sessions;

-- Query 8: Top 10 Longest Sessions

SELECT *
FROM sessions
ORDER BY session_duration DESC
LIMIT 10;

-- Query 9: Most Used Features

SELECT
    feature_name,
    COUNT(*) AS total_usage
FROM feature_events
GROUP BY feature_name
ORDER BY total_usage DESC;

-- Query 10: Ticket Status Distribution

SELECT
    ticket_status,
    COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY ticket_status;

-- Query 11: Total Revenue

SELECT
    ROUND(SUM(amount),2) AS total_revenue
FROM subscriptions
WHERE payment_status = 'Paid';

-- Query 12: Top 10 Highest Subscription Payments

SELECT *
FROM subscriptions
ORDER BY amount DESC
LIMIT 10;