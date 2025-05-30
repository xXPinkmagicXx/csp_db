#!/bin/bash

# Note the -q = quiet flag (No printing of CREATE INDEX AND DROP INDEX) 
if [[ $INDEX_DEFAULT = 1 ]]; then
   echo "[Info] Creating default schema indexes"
   docker exec -it group12-postgres bash -c 'psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/default_index.sql > /dev/null 2>> error.log'
else

   if [[ $INDEX_ALL = 1 || $INDEX_DATES = 1 ]]; then
      echo "[Info] Creating indexes for dates"
      docker exec -it group12-postgres bash -c 'psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/dates_index.sql > /dev/null 2>> error.log'
   fi

   if [[ $INDEX_ALL = 1 || $INDEX_TEXT = 1 ]]; then
      echo "[Info] Creating indexes for text"
      docker exec -it group12-postgres bash -c 'psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/text_index.sql > /dev/null 2>> error.log'
   fi

   if [[ $INDEX_ALL = 1 || $INDEX_NUMBERS = 1 ]]; then
      echo "[Info] Creating indexes for numbers"
      docker exec -it group12-postgres bash -c 'psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -f ./scripts/numbers_index.sql > /dev/null 2>> error.log'
   fi
fi
