import boto3
from botocore.exceptions import ClientError
import json
import os

def get_secret():
    secret_name = "dbt/snowflake/credentials"
    region_name = "us-east-1"

    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        raise e

    # Get the secret as a dictionary
    secret = get_secret_value_response['SecretString']
    secret_dict = json.loads(secret)

    # Path to the .bashrc or .bash_profile
    bashrc_path = os.path.expanduser("~/.bashrc")  # Adjust if needed

    # Write export commands to .bashrc
    with open(bashrc_path, "a") as f:
        f.write(f'\nexport DBT_ACCOUNT="{secret_dict["DBT_ACCOUNT"]}"\n')
        f.write(f'export DBT_USER="{secret_dict["DBT_USER"]}"\n')
        f.write(f'export DBT_PASSWORD="{secret_dict["DBT_PASSWORD"]}"\n')
        f.write(f'export SNOWFLAKE_ROLE="{secret_dict["SNOWFLAKE_ROLE"]}"\n')
        f.write(f'export DBT_DATABASE="{secret_dict["DBT_DATABASE"]}"\n')
        f.write(f'export DBT_WAREHOUSE="{secret_dict["DBT_WAREHOUSE"]}"\n')
        f.write(f'export SNOWFLAKE_SCHEMA="{secret_dict["SNOWFLAKE_SCHEMA"]}"\n')

    print("Environment variables have been added to .bashrc")

if __name__ == "__main__":
    get_secret()
