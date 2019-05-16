<?php
class ci_formula2013 extends  abm_ci
{
     public $nombre_tabla = 'indice_complejidad';
     function conf__cuadro(toba_ei_cuadro $cuadro) {
        if (!is_null($this->s__where)) {
            $datos = $this->dep('datos')->tabla($this->nombre_tabla)->get_listado($this->s__where);
            $cuadro->set_datos($datos);
            
        } 
        
    }
}?>