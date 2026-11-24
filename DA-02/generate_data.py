import pandas as pd
import numpy as np
from faker import Faker
import random

# Generate user data using Faker
faker = Faker()
np.random.seed(42)

# 1. Create Synthetic CRM Table
num_customers = 500
crm_data = {
    'customer_id': [f'CUST_{i:03d}' for i in range(1, num_customers + 1)],
    'signup_date': [faker.date_between(start_date='-1y', end_date='today') for _ in range(num_customers)],
    'customer_segment': np.random.choice(['VIP', 'Regular', 'New', 'At-Risk'], num_customers, p=[0.1, 0.5, 0.3, 0.1]),
    'age': np.random.randint(18, 65, num_customers),
    'city': [faker.city() for _ in range(num_customers)]
}
df_crm = pd.DataFrame(crm_data)
df_crm.to_csv('synthetic_crm_data.csv', index=False)

# 2. Create Synthetic Ad-Spend Table
date_range = pd.date_range(start='2021-01-01', end='2021-01-31')
channels = ['Google_Search', 'Facebook_Ads', 'Instagram', 'YouTube']

ad_spend_list = []
for date in date_range:
    for channel in channels:
        ad_spend_list.append({
            'date': date.strftime('%Y-%m-%d'),
            'channel': channel,
            'ad_spend': round(random.uniform(100.0, 1500.0), 2),
            'impressions': random.randint(5000, 50000),
            'clicks': random.randint(200, 2000)
        })

df_ad_spend = pd.DataFrame(ad_spend_list)
df_ad_spend.to_csv('synthetic_ad_spend.csv', index=False)

print("Synthetic CRM and Ad-Spend CSV files generated successfully!")