#!/bin/bash

# This files assumes the following enviroment vairables are set
# SCALE
# INDEX
# PGPORT
echo "Drop dates: $INDEX_DATES"
if [[ $INDEX_DATES != 1 ]]; then
   echo "[Info] Dropping date indexes"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -f ./scripts/drop_dates_indexes.sql
fi

echo "Drop numbers: $INDEX_NUMBERS"
if [[ $INDEX_NUMBERS != 1 ]]; then
   echo "[Info] Dropping numbers indexes"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -f ./scripts/drop_numbers_indexes.sql
fi

echo "Drop text: $INDEX_TEXT"
if [[ $INDEX_TEXT != 1 ]]; then
   echo "[Info] Dropping text indexes"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -f ./scripts/drop_text_indexes.sql
fi
