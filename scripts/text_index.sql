

-- Indexes for region
CREATE INDEX idx_region_r_name ON region (r_name);
CREATE INDEX idx_region_r_comment ON region (r_comment);

-- Indexes for nation
CREATE INDEX idx_nation_n_name ON nation(n_name);
CREATE INDEX idx_nation_n_comment ON nation(n_comment);

-- Indexes for part
CREATE INDEX idx_part_p_name ON part(p_name);
CREATE INDEX idx_part_p_mfgr ON part(p_mfgr);
CREATE INDEX idx_part_p_brand ON part(p_brand);
CREATE INDEX idx_part_p_type ON part(p_type);
CREATE INDEX idx_part_p_container ON part(p_container);
CREATE INDEX idx_part_p_comment ON part(p_comment);

-- Indexes for supplier
CREATE INDEX idx_supplier_s_name ON supplier(s_name);
CREATE INDEX idx_supplier_s_address ON supplier(s_address);
CREATE INDEX idx_supplier_s_phone ON supplier(s_phone);
CREATE INDEX idx_supplier_s_comment ON supplier(s_comment);

-- Indexes for partsupp
CREATE INDEX idx_partsupp_ps_supplycost ON partsupp(ps_supplycost);
CREATE INDEX idx_partsupp_ps_comment ON partsupp(ps_comment);

-- Indexes for customer
CREATE INDEX idx_customer_c_name ON customer(c_name);
CREATE INDEX idx_customer_c_address ON customer(c_address);
CREATE INDEX idx_customer_c_phone ON customer(c_phone);
CREATE INDEX idx_customer_c_mktsegment ON customer(c_mktsegment);
CREATE INDEX idx_customer_c_comment ON customer(c_comment);

-- Indexes for orders
CREATE INDEX idx_orders_o_orderstatus ON orders(o_orderstatus);
CREATE INDEX idx_orders_o_orderpriority ON orders(o_orderpriority);
CREATE INDEX idx_orders_o_clerk ON orders(o_clerk);
CREATE INDEX idx_orders_o_comment ON orders(o_comment);

-- Indexes for lineitem
CREATE INDEX idx_lineitem_l_returnflag ON lineitem(l_returnflag);
CREATE INDEX idx_lineitem_l_linestatus ON lineitem(l_linestatus);
CREATE INDEX idx_lineitem_l_shipinstruct ON lineitem(l_shipinstruct);
CREATE INDEX idx_lineitem_l_shipmode ON lineitem(l_shipmode);
CREATE INDEX idx_lineitem_l_comment ON lineitem(l_comment);




