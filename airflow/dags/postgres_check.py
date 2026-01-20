from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
import psycopg2

def check_db():
    conn = psycopg2.connect(
        host="host.docker.internal",
        port=6543,
        dbname="de_db",
        user="de_user",
        password="postgres",
    )
    with conn.cursor() as cur:
        cur.execute("SELECT 1;")
        print("DB says:", cur.fetchone())
    conn.close()

with DAG(
    dag_id="postgres_check",
    start_date=datetime(2025, 1, 1),
    schedule=None,
    catchup=False,
    tags=["test", "postgres"],
) as dag:
    PythonOperator(task_id="select_1", python_callable=check_db)
