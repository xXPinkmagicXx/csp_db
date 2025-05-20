#!/bin/bash


export PGPASSWORD="$POSTGRES_PASSWORD"
echo "[Info] Running run_all_experiments.sh with scale factor: $SCALE index: $INDEX"
./usr/local/bin/docker-entrypoint.sh "$@" &

# Wait for postgres to be ready
echo "[Info] user: $POSTGRES_USER"
START=$(date +%s)
until pg_isready -U "$POSTGRES_USER" -h localhost -p "$PGPORT" -d tpch ; do
   ELAPSED=$(date +%s)
   echo "[Waited $((END - ELAPSED)) s] for Postgres to initialize tables with data..."
   sleep 10
done
echo "[Info] Postgres is ready. Running schema.sql..."
echo "[Info] Creating tables (if they do not exist)"
psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./schema.sql > /dev/null 2>> error.log

# Make sure that all the experiments run
set +e # Continue on error
# Run all the different experiments

INDEX_ALL=0
INDEX_NUMBERS=1
INDEX_DATES=0
INDEX_TEXT=0
echo "[Info] EXPERIMENT NUMBERS INDEXES"
scripts/run_experiment.sh


INDEX_ALL=0
INDEX_NUMBERS=0
INDEX_DATES=1
INDEX_TEXT=0
echo "[Info] EXPERIMENT DATES INDEXES"
scripts/run_experiment.sh

INDEX_ALL=0
INDEX_NUMBERS=0
INDEX_DATES=0
INDEX_TEXT=1
echo "[Info] EXPERIMENT TEXT INDEXES"
scripts/run_experiment.sh


INDEX_ALL=0
INDEX_NUMBERS=1
INDEX_DATES=1
INDEX_TEXT=0
echo "[Info] EXPERIMENT NUMBERS+DATES INDEXES"
scripts/run_experiment.sh

INDEX_ALL=0
INDEX_NUMBERS=1
INDEX_DATES=0
INDEX_TEXT=1
echo "[Info] EXPERIMENT NUMBERS+TEXT INDEXES"
scripts/run_experiment.sh

INDEX_ALL=0
INDEX_NUMBERS=0
INDEX_DATES=1
INDEX_TEXT=1
echo "[Info] EXPERIMENT DATES+TEXT INDEXES"
scripts/run_experiment.sh

INDEX_ALL=1
INDEX_NUMBERS=1
INDEX_DATES=1
INDEX_TEXT=1
echo "[Info] EXPERIMENT ALL INDEXES"
scripts/run_experiment.sh