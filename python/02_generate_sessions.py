import pandas as pd
from faker import Faker
import random

fake = Faker()

# Load users
users = pd.read_csv("../data/raw/users.csv")
print(users.columns)
print(users.head()) 

sessions = []

NUM_SESSIONS = 3500

devices = ["Mobile", "Desktop", "Tablet"]
browsers = ["Chrome", "Firefox", "Edge", "Safari"]

for session_id in range(1, NUM_SESSIONS + 1):

    user = users.sample(1).iloc[0]
    print(user)
    print(user.index)

    login = fake.date_time_between(start_date="-2y", end_date="now")

    duration = random.randint(5, 240)

    logout = login + pd.Timedelta(minutes=duration)

    sessions.append({

        "session_id": session_id,
        "user_id": user["user_id"],
        "login_time": login,
        "logout_time": logout,
        "session_duration": duration,
        "device": random.choice(devices),
        "browser": random.choice(browsers)

    })

df = pd.DataFrame(sessions)

print(df.head())

df.to_csv("../data/raw/sessions.csv", index=False)

print("sessions.csv generated successfully!")