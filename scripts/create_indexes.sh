#!/bin/bash

# Note the -q = quiet flag (No printing of CREATE INDEX AND DROP INDEX) 
if [[ $INDEX_ALL = 1 || $INDEX_DATES = 1 ]]; then
   echo "[Info] Creating indexes for dates"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/dates_index.sql > /dev/null 2>> error.log
fi

if [[ $INDEX_ALL = 1 || $INDEX_TEXT = 1 ]]; then
   echo "[Info] Creating indexes for text"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/text_index.sql > /dev/null 2>> error.log
fi

if [[ $INDEX_ALL = 1 || $INDEX_NUMBERS = 1 ]]; then
   echo "[Info] Creating indexes for numbers"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/numbers_index.sql > /dev/null 2>> error.log
fi
