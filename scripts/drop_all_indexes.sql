SELECT 'DROP INDEX IF EXISTS "' || schemaname || '"."' || indexname || '";'
FROM pg_indexes
WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
  AND tablename NOT LIKE 'pg_%'
  AND indexname NOT IN (
    SELECT conname
    FROM pg_constraint
  );