<?php

class ci_generales extends abm_ci {

    protected $nombre_tabla = 'presupuesto_general';

    function evt__cuadro__seleccion($datos) {
        $this->dep('datos')->cargar($datos);
        $datos = $this->dep('datos')->tabla($this->nombre_tabla)->get();
        if ($datos['id_objeto_del_gasto'] == 4 || $datos['id_objeto_del_gasto'] == 5 || $datos['id_objeto_del_gasto'] == 6 || $datos['id_objeto_del_gasto'] == 80) {
            toba::notificacion()->agregar('El monto solo se puede modificar agregando o quitando cargos', 'info');
            //toba::vinculador()->navegar_a('mocovi_dev',819000047); //cargos
            $this->resetear();
        } else {
            $this->set_pantalla('pant_edicion');
        }
    }

}
