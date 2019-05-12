<?php
class dt_mocovi_descentralizado_tipo_permuta extends toba_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT id_tipo_permuta, tipo_permuta FROM mocovi_descentralizado_tipo_permuta ORDER BY tipo_permuta";
		return toba::db('descentralizado')->consultar($sql);
	}




}
?>