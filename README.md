# Airflow_dbt_sql project
This project demonstrates an end-to-end data pipeline built with Airflow, PostgreSQL, and dbt to ingest, validate, transform, and analyze NYC Yellow Taxi trip data at scale.
# Setup Instructions
1. Clone the Repository
2. Start Docker 
3. Connect PostgreSQL and Airflow with Docker:
   - For PostgreSQL, type: 'docker start de-postgres' in git bash
   - For Airflow, type: 'docker -compose up -d' in git bash
4. Access Airflow UI
   URL: http://localhost:8080
    Default credentials:
    Username: airflow
    Password: airflow
5. Verify PostgreSQL Connection:
   - type 'docker ps' in git bash

## Trigger the DAG in Airflow UI
<img width="1886" height="397" alt="image" src="https://github.com/user-attachments/assets/28b13212-6c6e-460b-a91d-56641d045bb0" />

'dbt_run_pipeline.py' contains airflow DAGs code.

This Airflow DAG orchestrates dbt transformations and data quality checks on a daily schedule.

## The Airflow DAGs performs the following

1. Runs dbt models
2. Executes dbt run to build staging and fact models
3. Transforms raw taxi trip data into analytics-ready tables
4. Validates data quality
5. Executes dbt test after the run completes
6. Ensures key constraints and data assumptions are met
7. Enforces execution order

## How it works
1. The DAG is scheduled to run daily
2. It uses Airflow’s BashOperator to execute dbt CLI commands
3. dbt is run from the project directory using a specified profiles.yml
4. Only selected models and their dependencies are executed

# Raw data
- January 2025 data is used. You can find more data at: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page
  
# Staging
- stg_yellow_tripdata

- Cleaned and standardized raw taxi trip data

# Dimensions

- dim_locations

- Unique pickup and dropoff locations

- dim_time

- Date-level time dimension derived from pickup/dropoff timestamps

# Fact

- fact_trips

- Main fact table containing trip metrics

- Includes fare, distance, duration, and location keys

# Analytical Queries

- The following PostgreSQL queries are included in sql/analytical_queries.sql  or my_dbt/models/marts/01_rolling_avg_zone.sql

- Rolling 7-day average revenue by zone. The result can be found via PostgreSQL:
  <img width="539" height="353" alt="image" src="https://github.com/user-attachments/assets/974eccc2-0e1a-4fdb-8f9c-b3639b139a97" />

- Driver ranking by total revenue within each zone (my_dbt/models/marts/02_driver_ranking_by_total_revenue_zone.sql):
  <img width="591" height="316" alt="image" src="https://github.com/user-attachments/assets/dfddbd75-d4bb-455b-a7a0-eadbd8a1f380" />

- Peak hour detection by location (my_dbt/models/marts/03_peak_hour_detection_by_location.sql):
  <img width="546" height="324" alt="image" src="https://github.com/user-attachments/assets/f6b85013-b5ec-4b10-b76f-7dabd15ff492" />

