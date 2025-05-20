-- This files contains the indecies for all dates
-- orders
--lineitem
CREATE INDEX IF NOT EXISTS o_od ON orders (o_orderdate ASC);
CREATE INDEX IF NOT EXISTS l_sd ON lineitem (l_shipdate ASC);
CREATE INDEX IF NOT EXISTS l_cd ON lineitem (l_commitdate ASC);
CREATE INDEX IF NOT EXISTS l_rd ON lineitem (l_receiptdate ASC);
