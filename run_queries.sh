#!/bin/sh

export $(grep -v '^#' .env | xargs)

OLD_IFS=$IFS
IFS=','

for query in $QUERIES; do
    $DBT3_RUN_QUERY_COMMAND --db-name=tpch --dss=$DSS \
    --dss-query=$DSS_QUERY --scale-factor=$SCALE \
    --tpchtools=$TPCHTOOLS $query pgsql
done

IFS=$OLD_IFS
