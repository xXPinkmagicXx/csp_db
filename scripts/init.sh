#!/bin/bash

set -e

export PGPASSWORD="$POSTGRES_PASSWORD"
echo "Running init.sh with scale factor: $SCALE index: $INDEX"
./usr/local/bin/docker-entrypoint.sh "$@" &

echo "user: $POSTGRES_USER"
START=$(date +%s)
until pg_isready -U "$POSTGRES_USER" -h localhost -p "$PGPORT" -d tpch ; do
   ELAPSED=$(date +%s)
   echo "[Waited $((END - ELAPSED)) s] for Postgres to initialize tables with data..."
   sleep 10
done

echo "[Info] Postgres is ready. Running schema.sql..."

# Creating tables if they do not exist
echo "[Info] Creating tables (if they do not exist)"
psql -U postgres -h localhost -p "$PGPORT" -d tpch -f ./schema.sql



# Drop indexes to setup the database for a new experiment
scripts/drop_indexes.sh


# Add the current indexes that is used for experiment
scripts/create_indexes.sh