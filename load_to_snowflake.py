import snowflake.connector
import pandas as pd
from snowflake.connector.pandas_tools import write_pandas
import os
from dotenv import load_dotenv

load_dotenv()

# Load the CSV
df = pd.read_csv('Sample - Superstore.csv', encoding='latin1')

# Clean column names - remove spaces and special characters
df.columns = df.columns.str.upper().str.replace(' ', '_').str.replace('-', '_')

print(f"Loaded {len(df)} rows")
print(df.columns.tolist())

# Connect to Snowflake
conn = snowflake.connector.connect(
    user=os.getenv('SNOWFLAKE_USER'),
    password=os.getenv('SNOWFLAKE_PASSWORD'),
    account=os.getenv('SNOWFLAKE_ACCOUNT'),
    warehouse='COMPUTE_WH',
    database='SALES_PIPELINE',
    schema='RAW'
)

# Upload to Snowflake
write_pandas(conn, df, 'SUPERSTORE_RAW', auto_create_table=True)

print("Data loaded successfully!")
conn.close()