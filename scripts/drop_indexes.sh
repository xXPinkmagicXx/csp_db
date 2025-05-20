#!/bin/bash

# This files assumes the following enviroment vairables are set
# SCALE
# INDEX
# PGPORT

# Note the '-q' = quiet (no printing of CREATE INDEX and DROP INDEX) 
if [[ $INDEX_DATES != 1 ]]; then
   echo "[Info] Dropping date indexes"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/drop_dates_indexes.sql > /dev/null 2>> error.log
else
   echo "[Info] Keeping date indexes"
fi

if [[ $INDEX_NUMBERS != 1 ]]; then
   echo "[Info] Dropping numbers indexes"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/drop_numbers_indexes.sql > /dev/null 2>> error.log
else
   echo "[Info] Keeping numbers indexes"
fi

if [[ $INDEX_TEXT != 1 ]]; then
   echo "[Info] Dropping text indexes"
   psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/drop_text_indexes.sql > /dev/null 2>> error.log
else
   echo "[Info] Keeping text indexes"
fi
