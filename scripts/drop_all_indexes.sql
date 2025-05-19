-- DATES --
-- orders
DROP INDEX IF EXISTS o_od;
--lineitem
DROP INDEX IF EXISTS l_sd;
DROP INDEX IF EXISTS l_cd;
DROP INDEX IF EXISTS l_rd;


-- Integers and decimals 
DROP INDEX IF EXISTS p_rp;
DROP INDEX IF EXISTS p_s;
DROP INDEX IF EXISTS s_actb;
DROP INDEX IF EXISTS ps_avqt;
DROP INDEX IF EXISTS c_acb;
DROP INDEX IF EXISTS o_tp;
DROP INDEX IF EXISTS l_q;
DROP INDEX IF EXISTS l_extp;
DROP INDEX IF EXISTS l_disc;
DROP INDEX IF EXISTS l_tax;


-- SELECT 'DROP INDEX IF EXISTS "' || schemaname || '"."' || indexname || '";'
-- FROM pg_indexes
-- WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
--   AND tablename NOT LIKE 'pg_%'
--   AND indexname NOT IN (
--     SELECT conname
--     FROM pg_constraint
--   );