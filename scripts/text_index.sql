

-- Indexes for region
CREATE INDEX IF NOT EXISTS idx_region_r_name ON region (r_name);
CREATE INDEX IF NOT EXISTS idx_region_r_comment ON region (r_comment);
CREATE INDEX IF NOT EXISTS idx_nation_n_name ON nation(n_name);
CREATE INDEX IF NOT EXISTS idx_nation_n_comment ON nation(n_comment);
CREATE INDEX IF NOT EXISTS idx_part_p_name ON part(p_name);
CREATE INDEX IF NOT EXISTS idx_part_p_mfgr ON part(p_mfgr);
CREATE INDEX IF NOT EXISTS idx_part_p_brand ON part(p_brand);
CREATE INDEX IF NOT EXISTS idx_part_p_type ON part(p_type);
CREATE INDEX IF NOT EXISTS idx_part_p_container ON part(p_container);
CREATE INDEX IF NOT EXISTS idx_part_p_comment ON part(p_comment);
CREATE INDEX IF NOT EXISTS idx_supplier_s_name ON supplier(s_name);
CREATE INDEX IF NOT EXISTS idx_supplier_s_address ON supplier(s_address);
CREATE INDEX IF NOT EXISTS idx_supplier_s_phone ON supplier(s_phone);
CREATE INDEX IF NOT EXISTS idx_supplier_s_comment ON supplier(s_comment);
CREATE INDEX IF NOT EXISTS idx_partsupp_ps_supplycost ON partsupp(ps_supplycost);
CREATE INDEX IF NOT EXISTS idx_partsupp_ps_comment ON partsupp(ps_comment);
CREATE INDEX IF NOT EXISTS idx_customer_c_name ON customer(c_name);
CREATE INDEX IF NOT EXISTS idx_customer_c_address ON customer(c_address);
CREATE INDEX IF NOT EXISTS idx_customer_c_phone ON customer(c_phone);
CREATE INDEX IF NOT EXISTS idx_customer_c_mktsegment ON customer(c_mktsegment);
CREATE INDEX IF NOT EXISTS idx_customer_c_comment ON customer(c_comment);
CREATE INDEX IF NOT EXISTS idx_orders_o_orderstatus ON orders(o_orderstatus);
CREATE INDEX IF NOT EXISTS idx_orders_o_orderpriority ON orders(o_orderpriority);
CREATE INDEX IF NOT EXISTS idx_orders_o_clerk ON orders(o_clerk);
CREATE INDEX IF NOT EXISTS idx_orders_o_comment ON orders(o_comment);
CREATE INDEX IF NOT EXISTS idx_lineitem_l_returnflag ON lineitem(l_returnflag);
CREATE INDEX IF NOT EXISTS idx_lineitem_l_linestatus ON lineitem(l_linestatus);
CREATE INDEX IF NOT EXISTS idx_lineitem_l_shipinstruct ON lineitem(l_shipinstruct);
CREATE INDEX IF NOT EXISTS idx_lineitem_l_shipmode ON lineitem(l_shipmode);
CREATE INDEX IF NOT EXISTS idx_lineitem_l_comment ON lineitem(l_comment);




