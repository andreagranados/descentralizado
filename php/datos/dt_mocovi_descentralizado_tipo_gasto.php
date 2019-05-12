<?php
class dt_mocovi_descentralizado_tipo_gasto extends toba_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT id_tipo_gasto, tipo_gasto FROM mocovi_descentralizado_tipo_gasto ORDER BY tipo_gasto";
                $sql = toba::perfil_de_datos()->filtrar($sql);
		return toba::db('descentralizado')->consultar($sql);
	}



}
?>