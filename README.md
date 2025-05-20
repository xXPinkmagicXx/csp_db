# csp_db
## Setup
### Data
First you have to generate the data for the experiment to the corresponding folder to be loaded into the database.
You have to clone this [repo](https://github.com/gregrahn/tpch-kit) and run the dbgen command with the correct scale. For the scale of 1 this would look like this:
```
dbgen -s 1
```
Then the generated files could be placed into data/sf1 folder.

### Start
You have to set the env values in the .env file. These determine which dataset is loaded into the db on start and what schema to use. Example:
```
SCALE=sf1
```
Other needed env variables can be seen in the example.env file.

After this a simple docker compose command should do the trick and the database should be accessible.

## Experiments

1. run
2. docker up + build
3. run experiment for scale (e.g sf1)
4. Initialize indexes
5. Run experiment
6. repeat 4-6 for all types of indexes and combinations

### The flow of scripts 
1. run_sf1.sh
2. run.sh
3. docker-compose up --build
4. docker exec bash (Get inside container)
5. scripts/run_all_experiments.sh
6. docker-entrypoint.sh
7. pg_isready (wait for docker to be ready)
8. psql with ./schema.sql
9. scripts/run_experiment.sh
10. scripts/drop_indexes.sh (in run_experiment.sh)
11. scripts/create_indexes.sh (in run_experiment.sh)
12. scripts/run_queries.sh (in run_experiment.sh)
13. Repeat 9-12 with all variation of indexing


## Run

### Run the postgres docker container

```bash
docker-compose run --rm --service-ports --entrypoint bash group12-postgres
```

### Run queries inside the docker container

Run sql file such as `schema.sql`

```bash
PGPASSWORD=password psql -U postgres -h group12-postgres -p $PGPORT -d testdb -f ./schema.sql
```

## Useful commands

### Docker

```bash
docker-compose down --volumes
```

```bash
docker-compose down --volumes --remove-orphans
```

### Postgres

Inside the docker container you can use the command
```bash
PGPASSWORD=password psql -U postgres -h group12-postgres -p 5432
```

Create database inside postgres
```bash
CREATE DATABASE <database_name>
```

See databases inside postgres
```bash
\l+
```

```bash
SELECT datname FROM pg_database;
```

Connect to `<db_name>`inside postgres
```bash
\c <db_name>
```

- \q = quit
- \c = connect to db
- \dn = list schemas in current database
- \dt

## Ideas

1. Setup

1. Script for running experiment

1. Script for initializing the database with the correct indicies

### Run test query
To run a specific query out of the possible 22 run the run_query.sh script with the query's number you want executed.
For example to run query 4:
```
./run_query.sh 4
```


