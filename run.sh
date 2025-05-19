#!/bin/bash

# docker-compose up --build
echo "Running 'docker-compose run'"

export $(grep -v '^#' .env | xargs)
docker-compose up -d --build
# docker-compose exec -it group12-postgres bash
# docker run --name group12-p -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 postgres
docker exec -it group12-postgres bash -c "chmod +x scripts/hello.sh && scripts/hello.sh"
# docker-compose run --rm --service-ports group12-postgres bash
