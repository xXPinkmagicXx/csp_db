#!/bin/bash

set -e

export PGPASSWORD="$POSTGRES_PASSWORD"
echo "Running init.sh"
./usr/local/bin/docker-entrypoint.sh "$@" &

# isready=$(pg_isready -h group12-postgres -U "$POSTGRES_USER" -p 5432)
# echo "$isready"

until pg_isready -h localhost -U "$POSTGRES_USER" -p 5432; do
   echo "Waiting for PostgreSQL to start..."
   sleep 2
done

echo "Postgres is ready. Running schema.sql..."


# PGPASSWORD=password psql -U postgres -h group12-postgres -p 5432 -c "CREATE DATABASE testdb IF NOT EXIST"
psql -U postgres -h localhost -p 5432 -d testdb -f ./schema.sql