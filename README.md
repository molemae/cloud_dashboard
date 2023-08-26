# Metabase Cloud Dashboard:
This repo is an adapted version of the original Cloud Dashbaord, where the metabase dashbord ran on an AWS EC2 instance with a SQL database on Amazon RDS. Since I can't afford keeping them online at the moment, I adapted the project to run on a local machine. In this repo, the database runs in a psql docker container and the dashbaord in a metabase docker container.
This version represents the infrastructure and does not include the dashboard. Although, queries are provided, that can be used to create a dashboard.

## Usage
1. [Install docker](https://docs.docker.com/get-docker/)
2. run docker-compose.yml
3. Open http://localhost:3000 to run metabase
4. Create a local account setting username and password
5. Connect to the database by entering the containerized datababases details:
    - *Select PostgreSQL*
    - *Pick a display name*
    - *Host*: postgres_service
    - *Port*: 5432
    - *Database name*: northwind_database
    - *Username*: postgres
    - *Password*: supersavepassword1234
    - and click connect database


## Requirements
- Docker
- python 3.8
    - pandas 1.6
## Docker Images:
 - metabase/metabase:latest
 - postgres:latest
