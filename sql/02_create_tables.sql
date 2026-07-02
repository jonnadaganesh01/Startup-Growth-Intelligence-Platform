USE startup_growth_db;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    signup_date DATE NOT NULL,
    country VARCHAR(50),
    device_type VARCHAR(20),
    subscription_plan VARCHAR(20) DEFAULT 'Free',
    account_status VARCHAR(20) DEFAULT 'Active'
);


CREATE TABLE sessions (

    session_id INT PRIMARY KEY AUTO_INCREMENT,

    user_id INT,

    login_time DATETIME,

    logout_time DATETIME,

    session_duration INT,

    device VARCHAR(30),

    browser VARCHAR(30),

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)

);

CREATE TABLE feature_events (

    event_id INT PRIMARY KEY AUTO_INCREMENT,

    user_id INT,

    session_id INT,

    feature_name VARCHAR(100),

    event_time DATETIME,

    event_type VARCHAR(50),

    FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    FOREIGN KEY (session_id)
        REFERENCES sessions(session_id)

);

CREATE TABLE subscriptions (

    subscription_id INT PRIMARY KEY AUTO_INCREMENT,

    user_id INT,

    plan_name VARCHAR(50),

    start_date DATE,

    end_date DATE,

    amount DECIMAL(10,2),

    payment_status VARCHAR(30),

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)

);

CREATE TABLE support_tickets (

    ticket_id INT PRIMARY KEY AUTO_INCREMENT,

    user_id INT,

    issue_type VARCHAR(100),

    priority VARCHAR(20),

    ticket_status VARCHAR(30),

    created_at DATETIME,

    resolved_at DATETIME,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)

);