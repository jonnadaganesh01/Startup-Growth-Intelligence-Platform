CREATE INDEX idx_signup_date
ON users(signup_date);

CREATE INDEX idx_country
ON users(country);

CREATE INDEX idx_login_time
ON sessions(login_time);

CREATE INDEX idx_feature_name
ON feature_events(feature_name);

CREATE INDEX idx_subscription_plan
ON subscriptions(plan_name);

CREATE INDEX idx_ticket_status
ON support_tickets(ticket_status);