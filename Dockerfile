FROM apache/superset

USER root
RUN pip install mysqlclient psycopg2-binary elasticsearch-dbapi clickhouse-connect

USER superset
RUN superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin
RUN superset db upgrade
RUN superset load_examples
RUN superset init