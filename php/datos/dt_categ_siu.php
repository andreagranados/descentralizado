<?php

class dt_categ_siu extends toba_datos_tabla {

    function get_descripciones($id_escalafon = null) {
        if (!is_null($id_escalafon)) {
            $where = "where escalafon='$id_escalafon'";
        } else {
            $where = '';
        }
        $sql = "SELECT codigo_siu, descripcion FROM categ_siu $where ORDER BY descripcion";
        return toba::db('descentralizado')->consultar($sql);
    }

    function get_descripciones_docentes() {
        return $this->get_descripciones('D');
    }

}
