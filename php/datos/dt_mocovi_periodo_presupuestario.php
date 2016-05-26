<?php
class dt_mocovi_periodo_presupuestario extends toba_datos_tabla
{
	function get_descripciones()
	{
		$sql = "SELECT id_periodo,  anio FROM mocovi_periodo_presupuestario
                        Where presupuestando is true ORDER BY id_periodo";
		return toba::db('descentralizado')->consultar($sql);
	}







}
?>