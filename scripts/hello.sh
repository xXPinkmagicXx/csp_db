#!/bin/bash

echo "Hello"

sleep 3

PGPASSWORD=password psql -U postgres -h group12-postgres -p 5432 -f scripts/drop_all_indexes.sql