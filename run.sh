#!/bin/bash

# docker-compose up --build
echo "Running 'docker-compose run'"


docker-compose up --build
# docker-compose exec -it group12-postgres bash
docker-compose run --rm --service-ports group12-postgres bash
