#!/bin/bash

# docker-compose up --build
echo "Running 'docker-compose run'"

export $(grep -v '^#' .env | xargs)
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

docker exec -it group12-postgres bash -c "chmod +x scripts/init.sh && scripts/init.sh"
# docker-compose run --rm --service-ports group12-postgres bash
