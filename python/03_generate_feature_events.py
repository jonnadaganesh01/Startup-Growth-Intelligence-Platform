import pandas as pd
from faker import Faker
import random

fake = Faker()

users = pd.read_csv("../data/raw/users.csv")
sessions = pd.read_csv("../data/raw/sessions.csv")

events = []

feature_names = [
    "Dashboard",
    "Login",
    "Profile",
    "Search",
    "Analytics",
    "Reports",
    "Settings",
    "Notifications",
    "Billing",
    "Export"
]

event_types = [
    "Click",
    "View",
    "Download",
    "Upload",
    "Update"
]

NUM_EVENTS = 10000

for event_id in range(1, NUM_EVENTS + 1):

    session = sessions.sample(1).iloc[0]

    events.append({
        "event_id": event_id,
        "user_id": session["user_id"],
        "session_id": session["session_id"],
        "feature_name": random.choice(feature_names),
        "event_time": fake.date_time_between(start_date="-2y", end_date="now"),
        "event_type": random.choice(event_types)
    })

df = pd.DataFrame(events)

print(df.head())

df.to_csv("../data/raw/feature_events.csv", index=False)

print("✅ feature_events.csv generated successfully!")