# Metabase Cloud Dashboard:
This repository is a modified version of the original Cloud Dashboard project. Initially, the Metabase dashboard ran on an AWS EC2 instance, while the SQL database ran on Amazon RDS. Due to budget constraints, I've adapted the project to run locally.

Within this repo, the database runs in a psql Docker container, and the dashboard in a Metabase Docker container. This version primarily showcases the infrastructure and does not include the dashboard. However, I've added queries that were used to create the dashboard in the original version.

I've included a tool that uses pandas and the provided CSV files to efficiently construct the SQL data model. It simplifies the process of adding more CSV files to the database or even lets you create your own database and dashboard based using a different set of csv files.

## Usage
1. [Install docker](https://docs.docker.com/get-docker/)
2. *Optional: to add new files to the database, run data_model_creator.py*
3. *Optional: configure the PostgreSQL credentials within the docker-compose.yml file.*
4. Run docker-compose.yml
5. Open http://localhost:3000 to run metabase
6. Create a local account setting username and password
7. Connect to the database by entering details. Default:
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
