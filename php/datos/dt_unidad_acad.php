<?php

class dt_unidad_acad extends toba_datos_tabla {

    function get_descripciones() {
        $sql = "SELECT sigla, descripcion FROM unidad_acad ORDER BY descripcion";
        $sql = toba::perfil_de_datos()->filtrar($sql);
        return toba::db('descentralizado')->consultar($sql);
    }

    function get_descripciones_sin_filtro() {
        $sql = "SELECT sigla, descripcion FROM unidad_acad
                Where id_tipo_dependencia in (2,3)
                ORDER BY descripcion";
        //$sql=toba::perfil_de_datos()->filtrar($sql);
        return toba::db('descentralizado')->consultar($sql);
    }

    
   

}
