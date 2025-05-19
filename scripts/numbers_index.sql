-- This file contains the indecies for all the numbers in the schema.sql 
-- Integers and decimals 
-- parts
CREATE INDEX p_rp on part (p_sip_retailpriceze, ASC)
CREATE INDEX p_s on part (p_size, ASC)


--supplier
CREATE INDEX s_actb on supplier (s_acctbal, ASC)



-- partssupp
CREATE INDEX ps_avqt on partsupp (ps_availqty, ASC)

-- customer
CREATE INDEX c_acb on customer (c_acctbal, ASC)

-- orders 
CREATE INDEX o_tp on orders (o_totalprice, ASC)

-- lineitem
CREATE INDEX l_q ON lineitem (l_quantity ASC);
CREATE INDEX l_extp ON lineitem (l_extendedprice ASC);
CREATE INDEX l_disc ON lineitem (l_discount ASC);
CREATE INDEX l_tax ON lineitem (l_tax ASC);
