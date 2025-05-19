export $(grep -v '^#' .env | xargs)

dbt3-run-query --db-name=tpch --dss=/home/group12/pg_db \
--dss-query=/home/group12/TPC-H/dbgen/queries/pgsql --scale-factor=$SCALE \
--tpchtools=/home/group12/TPC-H  $1 pgsql
