from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator

PROJECT_DIR = "/opt/airflow/dbt/my_dbt"
PROFILES_DIR = "/opt/airflow/dbt_profiles"

default_args = {
    "retries": 2,
    "retry_delay": timedelta(minutes=2),
}

with DAG(
    dag_id="dbt_run_pipeline",
    start_date=datetime(2025, 1, 1),
    schedule="@daily",      # <-- better than None for assessment
    catchup=False,
    default_args=default_args,
    tags=["dbt"],
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=(
            f"cd {PROJECT_DIR} && "
            f"dbt run --profiles-dir {PROFILES_DIR} "
            f"--select stg_yellow_tripdata+ fct_yellow_trips_enriched"
        ),
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=(
            f"cd {PROJECT_DIR} && "
            f"dbt test --profiles-dir {PROFILES_DIR} "
            f"--select stg_yellow_tripdata+ fct_yellow_trips_enriched"
        ),
    )

    dbt_run >> dbt_test
