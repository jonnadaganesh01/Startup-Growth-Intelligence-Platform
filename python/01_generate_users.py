from faker import Faker
import pandas as pd
import random

fake = Faker()

countries = [
    "India",
    "USA",
    "Canada",
    "Australia",
    "Germany",
    "UK"
]

devices = [
    "Mobile",
    "Desktop",
    "Tablet"
]

plans = [
    "Free",
    "Premium",
    "Pro"
]

status = [
    "Active",
    "Inactive"
]

users = []

# Generate 1000 users first for testing
for i in range(1000):
    users.append({
        "full_name": fake.name(),
        "email": fake.unique.email(),
        "signup_date": fake.date_between(start_date="-2y", end_date="today"),
        "country": random.choice(countries),
        "device_type": random.choice(devices),
        "subscription_plan": random.choice(plans),
        "account_status": random.choice(status)
    })

df = pd.DataFrame(users)
df.insert(0, "user_id", range(1, len(df) + 1))

print(df.head())

df.to_csv("../data/raw/users.csv", index=False)

print("✅ users.csv generated successfully!")