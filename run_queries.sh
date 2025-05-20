#!/bin/sh

export $(grep -v '^#' .env | xargs)

OLD_IFS=$IFS
IFS=','

for query in $QUERIES; do
    /home/group12/kit/bin/dbt3-run-query --db-name=tpch --dss=/home/group12/pg_db \
    --dss-query=/home/group12/TPC-H/dbgen/queries/pgsql --scale-factor=$SCALE \
    --tpchtools=/home/group12/TPC-H  $query pgsql
done

IFS=$OLD_IFS


