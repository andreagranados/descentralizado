<?php

class dt_mocovi_descentralizado_accion extends toba_datos_tabla {
    function get_descripciones()
	{
		$sql = "SELECT * FROM("
                        . " SELECT * FROM mocovi_descentralizado_accion "
                        . " WHERE descripcion <> 'Otro'"
                        . " order by descripcion )sub"
                        . " UNION ALL "
                        . "SELECT * "
                        . " FROM mocovi_descentralizado_accion "
                        . " WHERE descripcion='OTRAS ACCIONES'";
		return toba::db('descentralizado')->consultar($sql);
	}
}
?>