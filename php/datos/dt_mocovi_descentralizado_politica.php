<?php

class dt_mocovi_descentralizado_politica extends toba_datos_tabla {

    function get_listado($where = null) {

        $id_periodo_actual = php_mocovi::instancia()->periodo_a_presupuestar();
        if (is_null($where)) {
            $where = 'where t_mdp.id_periodo=' . $id_periodo_actual;
        } else {
            $where = ' where ' . $where;
        }

        $sql = "SELECT
			t_mdp.id_politica,
			t_mpp.anio as id_periodo_nombre,
                        t_mdp.id_unidad,
			t_ua.descripcion as id_unidad_nombre,
			t_mdp.politica
		FROM
			mocovi_descentralizado_politica as t_mdp
                        inner JOIN mocovi_periodo_presupuestario as t_mpp ON (t_mdp.id_periodo = t_mpp.id_periodo)
			inner JOIN unidad_acad as t_ua ON (t_mdp.id_unidad = t_ua.sigla)
                $where
		ORDER BY politica";
        $sql = toba::perfil_de_datos()->filtrar($sql);
        return toba::db('descentralizado')->consultar($sql);
    }

}

?>