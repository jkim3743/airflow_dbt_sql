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

## Data Models
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

- The following PostgreSQL queries are included in sql/analytical_queries.sql:

- Rolling 7-day average revenue by zone

- Driver ranking by total revenue within each zone

- Peak hour detection by location
