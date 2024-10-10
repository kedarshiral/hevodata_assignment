# DBT Project Setup Guide

## Overview

This guide will help you set up and execute the DBT project from the cloned repository. It covers everything from logging into your EC2 instance to running the project and verifying results.

## Prerequisites

Before you begin, ensure you have the following installed and configured:

- **Git**: A version control system to manage your code.
- **Python**: Version 3.8 or above.
- **DBT-Snowflake**: The DBT adapter for Snowflake.
- **AWS Account**: Access to Secrets Manager configured with your credentials.
- **EC2 Instance**: An Amazon EC2 instance to run the project.
- **Postgresql**: For source data.
- **Snowflake**: For target data.
- **hevo data pipeline**: Create pipeline to load data from source to destination


## Log in to EC2 Virtual Machine

- Use your SSH client to connect to your EC2 instance. The command generally looks like this:

  ```bash
  ssh -i "your-key.pem" ec2-user@your-ec2-public-dns
  ```
### Step 1: Install Docker
1. Update your system:
   ```bash
   sudo yum update -y
   ```
2. Install Docker:
   ```bash
   sudo yum install docker -y
   ```
3. Start Docker and enable it to run on startup:
   ```bash
   sudo service docker start
   sudo systemctl enable docker
   ```
4. Add your user to the Docker group (so you don’t need `sudo`):
   ```bash
   sudo usermod -aG docker $USER
   ```
   Log out and log back in for this to take effect.

5. Run this command to download the PostgreSQL image from Docker Hub:
```bash
docker pull postgres
```
6. Create a directory on your Amazon Linux machine to store PostgreSQL data:
```bash
mkdir -p ~/postgres_data
```
7. Start PostgreSQL by running the following command:
```bash
docker run --name my_postgres \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -p 5432:5432 \
    -v ~/postgres_data:/var/lib/postgresql/data \
    -d postgres
```
8. Check if PostgreSQL is running with:
```bash
docker ps
```

This will show your running containers. If you see `my_postgres`, it means the PostgreSQL container is up and running.

Now, PostgreSQL is set up and running in Docker on your Amazon Linux machine!

### Step 2: Install dbt-snowflake
1. Install dbt-snowflake:
   ```bash
   pip install dbt-snowflake
   ```
2. Check version to insure its successful installation:
   ```bash
   dbt --version
   ```

## Steps to Execute the Project

### Step 3. Clone the Git Repository

- Clone the project repository by running:

  ```bash
  git clone https://github.com/kedarshiral/hevodata_assignment.git
  ```

### Step 4. Navigate to the DBT Project Directory

- Change to the project directory:

  ```bash
  cd hevodata_assignment/my_dbt_project
  ```

### Step 5. Run the Secrets Retrieval Script

- First create secrets using AWS secret manager
- Create IAM role for EC2 and add policy related to aws secret manager and attach that role to EC2

- Execute the following command to retrieve your AWS Secrets:

  ```bash
  python get_secrets.py
  ```

### Step 6. Verify Credential Configuration

- At this point, your credentials should be configured correctly. Ensure that your environment variables are set up as expected.

### Step 7. Run the DBT Project

- To build the models in your DBT project, run:

  ```bash
  dbt run
  ```

### Step 8. Execute Tests

- After the models have been built, execute the tests using:

  ```bash
  bash run_tests.sh
  ```

### Step 9. Verify Test Results

- Navigate to the `results` folder to check the output:

  ```bash
  cd results
  ```

- Verify the presence of the text files containing the test results.

## Conclusion

By following these steps, you will have successfully set up and executed the DBT project. Ensure to check the results in the `results` folder for confirmation of your tests.
