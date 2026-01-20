from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="dbt_run_local",
    start_date=datetime(2025, 1, 1),
    schedule=None,   # manual trigger
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=(
            "cd /opt/airflow/dbt/my_dbt && "
            "dbt run --profiles-dir /opt/airflow/dbt_profiles"
        ),
    )
