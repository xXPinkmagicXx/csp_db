#!/bin/bash
set -e

/usr/local/bin/docker-entrypoint.sh "$@" &

echo "Waiting for PostgreSQL to start..."
until pg_isready -U "$POSTGRES_USER"; do
  sleep 2
done

echo "Running SQL script: $SCRIPT"
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /scripts/$SCRIPT || echo "$SCRIPT failed"

wait
