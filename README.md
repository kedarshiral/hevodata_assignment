# dbt Snowflake Project

# Setting Up PostgreSQL in a Docker Container on Amazon Linux EC2

This guide provides step-by-step instructions to install and run PostgreSQL in a Docker container on an Amazon Linux EC2 instance. The container will map port 5432 of the EC2 instance to port 5432 of the PostgreSQL container, and ensure data persistence using Docker volumes.

---

## Prerequisites

- **Amazon Linux EC2 instance**
- **Docker** installed
- **PostgreSQL** Docker image

---

## Step 1: Install Docker on Amazon Linux

### 1.1 Update Your Packages

Log into your EC2 instance via SSH and update the package manager.

```bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
docker pull postgres
docker volume create postgres_data
sudo mkdir -p /media/data/postgres-data
docker run -d \
  -e POSTGRES_USER=hevodata \
  -e POSTGRES_PASSWORD=hevo@20 \
  -p 5432:5432 \
  -v /media/data/postgres-data:/var/lib/postgresql/data \
  postgres
docker ps


### This dbt project builds a materialized table `customers` in Snowflake.

## How to Run

1. Set up environment variables for Snowflake:
   ```bash
   export SNOWFLAKE_ACCOUNT=your_account
   export SNOWFLAKE_USER=your_user
   export SNOWFLAKE_PASSWORD=your_password
   export SNOWFLAKE_ROLE=your_role
   export SNOWFLAKE_WAREHOUSE=your_warehouse
   export SNOWFLAKE_DATABASE=your_database
   export SNOWFLAKE_SCHEMA=your_schema
