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
SCHEMA=schema.sql
```
After this a simple docker compose command should do the trick and the database should be accessible.
