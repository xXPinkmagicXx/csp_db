#!/bin/bash
set -e

echo "Loading schema..."
mkdir -p /tmp/init_scripts
cp "/schema.sql" /tmp/init_scripts/00_schema.sql
psql -U postgres -d tpch -f /tmp/init_scripts/00_schema.sql


echo "Loading TPC-H data into Postgres..."

mkdir -p /tmp/tpch_csv

# Remove trailing pipe if needed
for file in /data/*.tbl; do
  base=$(basename "$file" .tbl)
  sed 's/|$//' "$file" > "/tmp/tpch_csv/${base}.csv"
done

#Import CSVs into corresponding tables, the order matters
psql -U postgres -d tpch <<EOF
\copy region FROM '/tmp/tpch_csv/region.csv' DELIMITER '|' CSV;
\copy nation FROM '/tmp/tpch_csv/nation.csv' DELIMITER '|' CSV;
\copy part FROM '/tmp/tpch_csv/part.csv' DELIMITER '|' CSV;
\copy supplier FROM '/tmp/tpch_csv/supplier.csv' DELIMITER '|' CSV;
\copy partsupp FROM '/tmp/tpch_csv/partsupp.csv' DELIMITER '|' CSV;
\copy customer FROM '/tmp/tpch_csv/customer.csv' DELIMITER '|' CSV;
\copy orders FROM '/tmp/tpch_csv/orders.csv' DELIMITER '|' CSV;
\copy lineitem FROM '/tmp/tpch_csv/lineitem.csv' DELIMITER '|' CSV;
EOF

echo "TPC-H data loaded."