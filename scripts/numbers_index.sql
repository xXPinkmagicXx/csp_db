-- This file contains the indecies for all the numbers in the schema.sql 
-- Integers and decimals 
-- parts
CREATE INDEX IF NOT EXISTS p_rp on part (p_retailprice ASC);
CREATE INDEX IF NOT EXISTS p_s on part (p_size ASC);

CREATE INDEX IF NOT EXISTS s_actb on supplier (s_acctbal ASC);

CREATE INDEX IF NOT EXISTS ps_avqt on partsupp (ps_availqty ASC);

CREATE INDEX IF NOT EXISTS c_acb on customer (c_acctbal ASC);

CREATE INDEX IF NOT EXISTS o_tp on orders (o_totalprice ASC);

CREATE INDEX IF NOT EXISTS l_q ON lineitem (l_quantity ASC);
CREATE INDEX IF NOT EXISTS l_extp ON lineitem (l_extendedprice ASC);
CREATE INDEX IF NOT EXISTS l_disc ON lineitem (l_discount ASC);
CREATE INDEX IF NOT EXISTS l_tax ON lineitem (l_tax ASC);
