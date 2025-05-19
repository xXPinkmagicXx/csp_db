#!/bin/bash

echo "Hello"

# Current databases
PGPASSWORD=password psql -U postgres -h group12-postgres -p 5432 -c "\l+"

echo "Dropping all indexes"
PGPASSWORD=password psql -U postgres -h group12-postgres -p 5432 -f scripts/drop_all_indexes.sql


# PGPASSWORD=password psql -U postgres -h group12-postgres -p 5432 -c "CREATE DATABASE tpch IF NOT EXIST"
PGPASSWORD=password psql -U postgres -h group12-postgres -p 5432 -f scripts/numbers_index.sql
