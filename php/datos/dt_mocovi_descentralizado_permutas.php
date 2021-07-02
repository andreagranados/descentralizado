<?php

class dt_mocovi_descentralizado_permutas extends toba_datos_tabla {

    function get_listado($where = null) {
        $id_periodo_actual = php_mocovi::instancia()->periodo_a_presupuestar();
        if (is_null($where)) {
            $where = 'where t_mdp.id_periodo=' . $id_periodo_actual;
        } else {
            $where = ' where ' . $where;
        }
        $sql = "SELECT
			t_mdp.id_permutas,
                        t_mdp.id_unidad,
                        t_mdp.id_unidad_permuta,
                        t_mdp.id_categoria,
			t_mdtp.tipo_permuta as id_tipo_permuta_nombre,
			t_mdtg.tipo_gasto as id_tipo_gasto_nombre,
			t_mpp.anio as id_periodo_nombre,
			t_e.descripcion as id_escalafon_nombre,
			t_cs.descripcion as id_categoria_nombre,
			--t_ua.descripcion as id_unidad_nombre,
			t_mp.nombre as id_programa_nombre,
			--t_ua1.descripcion as id_unidad_permuta_nombre,
			t_mp2.nombre as id_programa_permuta_nombre,
			t_mdp.cantidad,
			t_mdp.descripcion
		FROM
			mocovi_descentralizado_permutas as t_mdp	LEFT OUTER JOIN mocovi_descentralizado_tipo_permuta as t_mdtp ON (t_mdp.id_tipo_permuta = t_mdtp.id_tipo_permuta)
			LEFT OUTER JOIN mocovi_descentralizado_tipo_gasto as t_mdtg ON (t_mdp.id_tipo_gasto = t_mdtg.id_tipo_gasto)
			LEFT OUTER JOIN mocovi_periodo_presupuestario as t_mpp ON (t_mdp.id_periodo = t_mpp.id_periodo)
			LEFT OUTER JOIN escalafon as t_e ON (t_mdp.id_escalafon = t_e.id_escalafon)
			LEFT OUTER JOIN categ_siu as t_cs ON (t_mdp.id_categoria = t_cs.codigo_siu)
			--LEFT OUTER JOIN unidad_acad as t_ua ON (t_mdp.id_unidad = t_ua.sigla)
			LEFT OUTER JOIN mocovi_programa as t_mp ON (t_mdp.id_programa = t_mp.id_programa)
			--LEFT OUTER JOIN unidad_acad as t_ua1 ON (t_mdp.id_unidad_permuta = t_ua1.sigla)
			LEFT OUTER JOIN mocovi_programa as t_mp2 ON (t_mdp.id_programa_permuta = t_mp2.id_programa)
                $where
		ORDER BY t_mdp.id_unidad,t_mp.nombre,t_mdp.id_unidad_permuta";


        $sql = toba::perfil_de_datos()->filtrar($sql);
        return toba::db('descentralizado')->consultar($sql);
    }

}
