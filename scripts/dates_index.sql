-- This files contains the indecies for all dates
-- orders
CREATE INDEX o_od ON orders (o_orderdate ASC);

--lineitem
CREATE INDEX l_sd ON lineitem (l_shipdate ASC);
CREATE INDEX l_cd ON lineitem (l_commitdate ASC);
CREATE INDEX l_rd ON lineitem (l_receiptdate ASC);
