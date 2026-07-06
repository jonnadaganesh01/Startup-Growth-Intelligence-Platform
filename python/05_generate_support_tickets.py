import pandas as pd
from faker import Faker
import random

fake = Faker()

users = pd.read_csv("../data/raw/users.csv")

issue_types = [
    "Login Issue",
    "Payment Failure",
    "Bug Report",
    "Feature Request",
    "Password Reset",
    "Subscription Issue",
    "Performance Issue"
]

priorities = [
    "Low",
    "Medium",
    "High"
]

statuses = [
    "Open",
    "In Progress",
    "Resolved",
    "Closed"
]

tickets = []

NUM_TICKETS = 800

for ticket_id in range(1, NUM_TICKETS + 1):

    user = users.sample(1).iloc[0]

    created = fake.date_time_between(start_date="-2y", end_date="now")

    if random.random() < 0.8:
        resolved = fake.date_time_between(start_date=created, end_date="now")
    else:
        resolved = None

    tickets.append({
        "ticket_id": ticket_id,
        "user_id": user["user_id"],
        "issue_type": random.choice(issue_types),
        "priority": random.choice(priorities),
        "ticket_status": random.choice(statuses),
        "created_at": created,
        "resolved_at": resolved
    })

df = pd.DataFrame(tickets)

print(df.head())

df.to_csv("../data/raw/support_tickets.csv", index=False)

print("✅ support_tickets.csv generated successfully!")