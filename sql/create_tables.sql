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