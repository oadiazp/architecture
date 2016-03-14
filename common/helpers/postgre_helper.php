<?php
    function pg_primary_keys ($pSchema, $pTable) {
        $db = &DB();

        $db->select ('column_name');
        $db->join ('information_schema.constraint_column_usage', 'information_schema.constraint_column_usage.constraint_name = information_schema.table_constraints.constraint_name');
        $db->where ('information_schema.table_constraints.constraint_type', 'PRIMARY KEY');
        $db->where ('information_schema.table_constraints.table_name', $pTable);
        $db->where ('information_schema.table_constraints.constraint_schema', $pSchema);
        
        $result = $db->get ('information_schema.table_constraints')->row ();
        return $result->column_name;
    }

    function pg_get_schemas () {
        $db = &DB ();
        return $db->query ("SELECT schema_name
                            FROM information_schema.schemata
                            WHERE schema_name LIKE 'mod_%'")->result ();

        
    }
?>
