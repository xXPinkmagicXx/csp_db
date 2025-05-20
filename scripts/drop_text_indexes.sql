-- DROP TEXT INDEXES
DROP INDEX IF EXISTS idx_region_r_name; 
DROP INDEX IF EXISTS idx_region_r_comment;

DROP INDEX IF EXISTS idx_nation_n_name; 
DROP INDEX IF EXISTS idx_nation_n_comment; 

DROP INDEX IF EXISTS idx_part_p_name; 
DROP INDEX IF EXISTS idx_part_p_mfgr; 
DROP INDEX IF EXISTS idx_part_p_brand; 
DROP INDEX IF EXISTS idx_part_p_type; 
DROP INDEX IF EXISTS idx_part_p_container; 
DROP INDEX IF EXISTS idx_part_p_comment; 

DROP INDEX IF EXISTS idx_supplier_s_name; 
DROP INDEX IF EXISTS idx_supplier_s_address; 
DROP INDEX IF EXISTS idx_supplier_s_phone; 
DROP INDEX IF EXISTS idx_supplier_s_comment; 
DROP INDEX IF EXISTS idx_partsupp_ps_supplycost; 
DROP INDEX IF EXISTS idx_partsupp_ps_comment; 

DROP INDEX IF EXISTS idx_customer_c_name; 
DROP INDEX IF EXISTS idx_customer_c_address; 
DROP INDEX IF EXISTS idx_customer_c_phone; 
DROP INDEX IF EXISTS idx_customer_c_mktsegment; 
DROP INDEX IF EXISTS idx_customer_c_comment; 

DROP INDEX IF EXISTS idx_orders_o_orderstatus; 
DROP INDEX IF EXISTS idx_orders_o_orderpriority; 
DROP INDEX IF EXISTS idx_orders_o_clerk; 
DROP INDEX IF EXISTS idx_orders_o_comment; 

DROP INDEX IF EXISTS idx_lineitem_l_returnflag; 
DROP INDEX IF EXISTS idx_lineitem_l_linestatus; 
DROP INDEX IF EXISTS idx_lineitem_l_shipinstruct; 
DROP INDEX IF EXISTS idx_lineitem_l_shipmode; 
DROP INDEX IF EXISTS idx_lineitem_l_comment; 