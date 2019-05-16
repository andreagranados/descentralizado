<?php
class dt_mocovi_periodo_presupuestario extends toba_datos_tabla
{
    
        static function get_periodo_a_presupuestar(){
        	$sql = "SELECT * FROM mocovi_periodo_presupuestario where presupuestando is true";
		return toba::db('descentralizado')->consultar($sql);
        }
        
	function get_descripciones()
	{
		$sql = "SELECT id_periodo,  anio FROM mocovi_periodo_presupuestario
                        Where presupuestando is true ORDER BY id_periodo";
		return toba::db('descentralizado')->consultar($sql);
	}

    function get_listado()
	{
		$sql = "SELECT * FROM mocovi_periodo_presupuestario
                         ORDER BY anio";
		return toba::db('descentralizado')->consultar($sql);
	}





}
?>