#!/bin/bash

set -e

export PGPASSWORD="$POSTGRES_PASSWORD"
echo "Running init.sh"
./usr/local/bin/docker-entrypoint.sh "$@" &

echo "user: $POSTGRES_USER"
START=$(date +%s)
until pg_isready -U "$POSTGRES_USER" -h localhost -p "$PGPORT" -d tpch ; do
   ELAPSED=$(date +%s)
   echo "[Waited $((END - ELAPSED)) s] for Postgres to initialize tables with data..."
   sleep 10
done

echo "Postgres is ready. Running schema.sql..."

# Creating tables if they do not exist
echo "[Info] Creating tables (if they do not exist)"
psql -U postgres -h localhost -p 5432 -d tpch -f ./schema.sql

# Drop all indexes
echo "[Info] Dropping all indexes"
psql -U postgres -h localhost -p 5432 -d tpch -f ./scripts/drop_all_indexes.sql

# Add the current indexes that is used for experiment
echo "[Info] Creating indexes for dates"
psql -U postgres -h localhost -p 5432 -d tpch -f ./scripts/dates_index.sql

