## Airflow_dbt_sql
# Airflow_dbt_sql project

# Setup Instructions
1. Clone the Repository
2. Start Services with Docker (type 'docker -compose up -d) in git bash
3. Access Airflow UI
   URL: http://localhost:8080
    Default credentials:
    Username: airflow
    Password: airflow
4. Verify PostgreSQL Connection

## Trigger the DAG in Airflow UI
<img width="1886" height="397" alt="image" src="https://github.com/user-attachments/assets/28b13212-6c6e-460b-a91d-56641d045bb0" />

'dbt_run_pipeline.py' contains airflow DAG code.

## Data Models

# Raw data
- January 2025 data is used.
  
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


- Driver ranking by total revenue within each zone

- Peak hour detection by location
