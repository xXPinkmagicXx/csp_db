#!/bin/bash

# docker-compose up --build
export $(grep -v '^#' .env | xargs)
if [[ -n "$1" ]]; then
  export SCALE="$1"
fi
echo "[Info] Running docker compose up with scale: $SCALE"

# INPUT VALIDATION
# EXIT if VAR is empty or not 0,1
if [[ -z "$INDEX_ALL" || $INDEX_ALL != 0 && $INDEX_ALL != 1 ]]; then
   echo "[Error] INDEX_ALL not correct - expected value: {0,1}"
   exit
fi
if [[ ! "$INDEX_NUMBERS" || $INDEX_NUMBERS != 0 && $INDEX_NUMBERS != 1 ]]; then
   echo "[Error] INDEX_NUMBERS not correct got '$INDEX_NUMBERS' expected value: {0,1}"
   exit
fi
if [[ -z "$INDEX_DATES" || $INDEX_DATES != 0 && $INDEX_DATES != 1 ]]; then
   echo "[Error] INDEX_DATES not correct - expected value: {0,1}"
   exit
fi
if [[ -z "$INDEX_TEXT" || $INDEX_TEXT != 0 && $INDEX_TEXT != 1 ]]; then
   echo "[Error] INDEX_TEXT not correct - expected value: {0,1}"
   exit
fi

# IF INDEX_ALL but others are not  
if [[ $INDEX_ALL = 1 ]]; then

   if [[ $INDEX_DATES != 1 ]]; then
      echo "[Error] INDEX_ALL=1 but INDEX_DATES=$INDEX_DATES - expected value: 1"
      exit
   fi
   
   if [[ $INDEX_TEXT != 1 ]]; then
      echo "[Error] INDEX_ALL=1 but INDEX_TEXT=$INDEX_TEXT - expected value: 1"
      exit

   fi

   if [[ $INDEX_NUMBERS != 1 ]]; then
      echo "[Error] INDEX_ALL=1 but INDEX_NUMBERS=$INDEX_NUMBERS - expected value: 1"
      exit
   fi

fi

if [[ $INDEX_ALL = 0 && $INDEX_NUMBERS = 0 && $INDEX_DATES = 0 && $INDEX_TEXT = 0 ]]; then
   echo "[Warning] NO INDEXING - Running the experiments with no indexing"
fi

# -- Script starts here 

# Build and spin up
if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
   docker compose up -d --build
else
   docker-compose up -d --build
fi

# Wait until the docker container is up
while ! docker exec group12-postgres bash -c  'pg_isready -U "$POSTGRES_USER" > /dev/null 2>&1 && [ -f "/var/lib/postgresql/data/.initialized" ]'
do
  echo "[Info] Postgres not ready yet"
  sleep 5
done
echo "[Info] PostgreSQL is ready!"

echo "[Info] Running 'docker exec' with scripts/run_all_experiments.sh"
# Give execute permission for files in scripts
docker exec -it group12-postgres bash -c "chmod +x scripts/*.sh"
./run_all_experiments.sh
# docker-compose run --rm --service-ports group12-postgres bash

