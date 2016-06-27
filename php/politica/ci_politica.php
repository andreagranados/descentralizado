<?php

class ci_politica extends descentralizado_abm_ci {

    protected $nombre_tabla = 'mocovi_descentralizado_politica';

    function resetear() {
        
    }

    function conf__formulario(toba_ei_formulario $form) {
        if ($this->dep('datos')->esta_cargada()) {
            //ei_arbol('paso');
            $form->set_datos($this->dep('datos')->tabla($this->nombre_tabla)->get());
        } else {
            //falta chequear el periodo
            $datos = $this->dep('datos')->tabla($this->nombre_tabla)->get_listado();
            if (isset($datos[0])) {
                $this->dep('datos')->cargar(array('id_politica' => $datos[0]['id_politica']));
            }
            $form->set_datos($this->dep('datos')->tabla($this->nombre_tabla)->get());
        }
    }

    function evt__formulario__alta($datos) {
        /*
         * todo: el periodo por defecto
         */
        if ($this->chequeo_solo_lectura()) {
            $this->resetear();
        } else {
            $this->dep('datos')->tabla($this->nombre_tabla)->set($datos);
            $this->dep('datos')->sincronizar();
            toba::notificacion()->agregar('El registro ha sido creado correctamente', 'info');
            $this->resetear();
        }
    }

    function evt__formulario__modificacion($datos) {
        if ($this->chequeo_solo_lectura()) {
            $this->resetear();
        } else {
            $this->dep('datos')->tabla($this->nombre_tabla)->set($datos);
            $this->dep('datos')->sincronizar();
            toba::notificacion()->agregar('El registro ha sido modificado correctamente', 'info');
            $this->resetear();
        }
    }

    function evt__formulario__baja() {
        if ($this->chequeo_solo_lectura()) {
            $this->resetear();
        } else {
            parent::evt__formulario__baja();
        }
    }
    
}
