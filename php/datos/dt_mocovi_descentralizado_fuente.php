<?php
class dt_mocovi_descentralizado_fuente extends toba_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT id_fuente, tipo FROM mocovi_descentralizado_fuente ORDER BY tipo";
		return toba::db('descentralizado')->consultar($sql);
	}
        
        function get_descripciones_ingresos()
	{
		$sql = "SELECT id_fuente, tipo FROM mocovi_descentralizado_fuente where id_fuente<>11 ORDER BY tipo";
		return toba::db('descentralizado')->consultar($sql);
	}

}
