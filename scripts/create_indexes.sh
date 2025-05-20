#!/bin/bash

if [[ $INDEX_ALL = 1 || $INDEX_DATES = 1 ]]; then
   echo "[Info] Creating indexes for dates"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -f ./scripts/dates_index.sql
fi

if [[ $INDEX_ALL = 1 || $INDEX_TEXT = 1 ]]; then
   echo "[Info] Creating indexes for text"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -f ./scripts/text_index.sql
fi

if [[ $INDEX_ALL = 1 || $INDEX_NUMBERS = 1 ]]; then
   echo "[Info] Creating indexes for numbers"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -f ./scripts/numbers_index.sql
fi
