#!/bin/bash

set -e # Stop on first error

# Drop indexes to setup the database for a new experiment
echo "[Info] Running drop_indexes.sh"
./drop_indexes.sh

# Add the current indexes that is used for experiment
echo "[Info] Running create_indexes.sh"
./create_indexes.sh
