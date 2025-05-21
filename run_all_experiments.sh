#!/bin/bash

echo "[Info] Running experiments with scale factor: $SCALE"

set +e  # continue on error

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
RESULTS_DIR="results_$TIMESTAMP"
mkdir -p "$RESULTS_DIR"
echo "[Info] Results will be saved in $RESULTS_DIR"

run_experiment_and_log() {
  local exp_name=$1
  local index_all=$2
  local index_numbers=$3
  local index_dates=$4
  local index_text=$5
  local logfile="$RESULTS_DIR/results_${exp_name}.log"
  local index_csv="$RESULTS_DIR/index_stats_${exp_name}.csv"

  echo "[Info] Running experiment: $exp_name"
  echo "=== Experiment: $exp_name ===" > "$logfile"
  echo "INDEX_ALL=$index_all" >> "$logfile"
  echo "INDEX_NUMBERS=$index_numbers" >> "$logfile"
  echo "INDEX_DATES=$index_dates" >> "$logfile"
  echo "INDEX_TEXT=$index_text" >> "$logfile"
  echo "" >> "$logfile"

  export INDEX_ALL=$index_all
  export INDEX_NUMBERS=$index_numbers
  export INDEX_DATES=$index_dates
  export INDEX_TEXT=$index_text

  ./run_experiment.sh >> "$logfile" 2>&1
  echo "" >> "$logfile"

  echo "[Info] Running queries($QUERIES) for $exp_name" >> "$logfile"
  IFS=',' read -r -a queries <<< "$QUERIES"

  for query in "${queries[@]}"; do
    exec_times=()
    for i in $(seq 1 "$QUERY_REPEAT")
    do
      output=$($DBT3_RUN_QUERY_COMMAND --db-name=tpch --dss=$DSS \
      --dss-query=$DSS_QUERY --scale-factor=$SCALE \
      --tpchtools=$TPCHTOOLS $query pgsql)
      if [ "$i" -eq 1 ]; then
        echo "$output" | head -n -1 >> "$logfile" 2>&1
      fi
      exec_time=$(echo "$output" | grep -E "Query [0-9]+ executed in" | sed -E 's/.*Query [0-9]+ executed in ([0-9.]+) second.*/\1/')
      exec_times+=("$exec_time")    
    done
    joined_times=$(IFS=,; echo "${exec_times[*]}")
    echo "Query $query execution times in seconds: $joined_times" >> "$logfile"

    sum=0
    count=0
    for time in "${exec_times[@]}"; do
      sum=$(echo "$sum + $time" | bc)
      ((count++))
    done

    average=$(echo "scale=4; $sum / $count" | bc)
    average=$(printf "%.4f" "$average")
    echo "Average execution time: $average seconds" >> "$logfile"
    echo "" >> "$logfile"

  done

  echo "" >> "$logfile"

  echo "[Info] Dumping index size stats to $index_csv"
  docker exec group12-postgres bash -c 'psql -U postgres -h localhost -p "$PGPORT" -d tpch -q -F ',' --no-align --pset pager=off -f ./scripts/get_info.sql' > "$index_csv"

  echo "[Info] Finished $exp_name, results saved to $logfile"
  echo ""
}


run_experiment_and_log "no_index" 0 0 0 0
run_experiment_and_log "numbers" 0 1 0 0
run_experiment_and_log "dates" 0 0 1 0
run_experiment_and_log "text" 0 0 0 1
run_experiment_and_log "numbers_dates" 0 1 1 0
run_experiment_and_log "numbers_text" 0 1 0 1
run_experiment_and_log "dates_text" 0 0 1 1
run_experiment_and_log "all" 1 1 1 1