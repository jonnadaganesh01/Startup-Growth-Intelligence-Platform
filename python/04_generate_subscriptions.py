import pandas as pd
from faker import Faker
import random

fake = Faker()

users = pd.read_csv("../data/raw/users.csv")

plans = {
    "Free": 0,
    "Premium": 499,
    "Pro": 999
}

payment_statuses = [
    "Paid",
    "Pending",
    "Failed"
]

subscriptions = []

NUM_SUBSCRIPTIONS = 700

selected_users = users.sample(NUM_SUBSCRIPTIONS)

for subscription_id, (_, user) in enumerate(selected_users.iterrows(), start=1):

    plan = random.choice(list(plans.keys()))

    start_date = fake.date_between(start_date="-2y", end_date="today")

    if plan == "Free":
        end_date = None
    else:
        end_date = fake.date_between(start_date=start_date, end_date="+365d")

    subscriptions.append({
        "subscription_id": subscription_id,
        "user_id": user["user_id"],
        "plan_name": plan,
        "start_date": start_date,
        "end_date": end_date,
        "amount": plans[plan],
        "payment_status": random.choice(payment_statuses)
    })

df = pd.DataFrame(subscriptions)

print(df.head())

df.to_csv("../data/raw/subscriptions.csv", index=False)

print("✅ subscriptions.csv generated successfully!")