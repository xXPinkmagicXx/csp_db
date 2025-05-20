#!/bin/bash

# docker-compose up --build
export $(grep -v '^#' .env | xargs)
echo "[Info] Running docker-compose up with scale: $SCALE"

docker-compose up -d --build

# Wait until the container is up (timeout after 30)
for i in {1..30}; do
  if docker exec group12-postgres pg_isready -U postgres > /dev/null 2>&1; then
    echo "PostgreSQL is ready!"
    break
  fi
  echo "Postgres not ready yet "
  sleep 1
done

echo "[Info] Running 'docker exec'"
# Give execute permission for files in scripts
docker exec -it group12-postgres bash -c "chmod +x scripts/*.sh && scripts/init.sh"
# docker-compose run --rm --service-ports group12-postgres bash
