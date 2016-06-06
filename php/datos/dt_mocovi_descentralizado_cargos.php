<?php

class dt_mocovi_descentralizado_cargos extends toba_datos_tabla {

    function get_listado($where = null) {
        $id_periodo_actual = php_mocovi::instancia()->periodo_a_presupuestar();
        if (is_null($where)) {
            $where = 'where t_mpp.id_periodo=' . $id_periodo_actual;
        } else {
            $where = ' where ' . $where;
        }
        $sql = "SELECT
			t_mdc.id_cargo,
                        t_mdc.id_fuente,
                        t_mdc.id_unidad,
                        t_mdc.id_categoria,
                        t_mdc.id_escalafon,
			t_mpp.anio as id_periodo_nombre,
			--t_ua.descripcion as id_unidad_nombre,
			t_cs.descripcion as id_categoria_nombre,
			t_mp.nombre as id_programa_nombre,
			t_mdtg.tipo_gasto as id_tipo_gasto_nombre,
			t_e.descripcion as id_escalafon_nombre,
			t_mdc.cantidad,
			t_mdc.descripcion,
			t_mdc.contratado
		FROM
			mocovi_descentralizado_cargos as t_mdc	LEFT OUTER JOIN mocovi_periodo_presupuestario as t_mpp ON (t_mdc.id_periodo = t_mpp.id_periodo)
			--inner join unidad_acad as t_ua ON (t_mdc.id_unidad = t_ua.sigla)
			LEFT OUTER JOIN categ_siu as t_cs ON (t_mdc.id_categoria = t_cs.codigo_siu)
			LEFT OUTER JOIN mocovi_programa as t_mp ON (t_mdc.id_programa = t_mp.id_programa)
			LEFT OUTER JOIN mocovi_descentralizado_tipo_gasto as t_mdtg ON (t_mdc.id_tipo_gasto = t_mdtg.id_tipo_gasto)
			LEFT OUTER JOIN escalafon as t_e ON (t_mdc.id_escalafon = t_e.id_escalafon)
                        $where
		ORDER BY t_mdc.id_categoria,
                        t_mdc.id_escalafon";
        $sql = toba::perfil_de_datos()->filtrar($sql);
        return toba::db('descentralizado')->consultar($sql);
    }

}

?>