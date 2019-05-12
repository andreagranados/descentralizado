<?php
class dt_mocovi_descentralizado_ingresos extends toba_datos_tabla
{
	function get_listado($where=null)
	{
            $id_periodo_actual = php_mocovi::instancia()->periodo_a_presupuestar();
        if (is_null($where)) {
            $where = 'where t_mpp.id_periodo=' . $id_periodo_actual;
        } else {
            $where = ' where ' . $where;
        }
		$sql = "SELECT
			t_mdi.id_ingresos,
			t_mpp.anio as id_periodo_nombre,
			t_mdi.id_unidad as id_unidad_nombre,
                        t_mdi.id_unidad,
			t_mdi.id_fuente,
                        --t_mdti.tipo as id_tipo_ingreso_nombre,
			t_mdi.descripcion,
			t_mdi.monto
		FROM
			mocovi_descentralizado_ingresos as t_mdi	LEFT OUTER JOIN mocovi_periodo_presupuestario as t_mpp ON (t_mdi.id_periodo = t_mpp.id_periodo)
			--LEFT OUTER JOIN unidad_acad as t_ua ON (t_mdi.id_unidad = t_ua.sigla)
			--LEFT OUTER JOIN mocovi_descentralizado_fuente as t_mdti ON (t_mdi.id_fuente = t_mdti.id_fuente)
                        
            $where
		ORDER BY descripcion";
                
                $sql = toba::perfil_de_datos()->filtrar($sql);
		return toba::db('descentralizado')->consultar($sql);
	}

}

?>