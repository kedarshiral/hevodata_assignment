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

## Steps to Execute the Project

### 1. Log in to EC2 Virtual Machine

- Use your SSH client to connect to your EC2 instance. The command generally looks like this:

  ```bash
  ssh -i "your-key.pem" ec2-user@your-ec2-public-dns
  ```

### 2. Clone the Git Repository

- Clone the project repository by running:

  ```bash
  git clone https://github.com/kedarshiral/hevodata_assignment.git
  ```

### 3. Navigate to the DBT Project Directory

- Change to the project directory:

  ```bash
  cd hevodata_assignment/my_dbt_project
  ```

### 4. Run the Secrets Retrieval Script

- First create secrets using AWS secret manager
- Create IAM role for EC2 and add policy related to aws secret manager and attach that role to EC2

- Execute the following command to retrieve your AWS Secrets:

  ```bash
  python get_secrets.py
  ```

### 5. Verify Credential Configuration

- At this point, your credentials should be configured correctly. Ensure that your environment variables are set up as expected.

### 6. Run the DBT Project

- To build the models in your DBT project, run:

  ```bash
  dbt run
  ```

### 7. Execute Tests

- After the models have been built, execute the tests using:

  ```bash
  bash run_tests.sh
  ```

### 8. Verify Test Results

- Navigate to the `results` folder to check the output:

  ```bash
  cd results
  ```

- Verify the presence of the text files containing the test results.

## Conclusion

By following these steps, you will have successfully set up and executed the DBT project. Ensure to check the results in the `results` folder for confirmation of your tests.
