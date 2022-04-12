<?php
class ci_acciones_x_objetogasto extends  abm_ci
{
    
    public $nombre_tabla = 'mocovi_presupuesto_general';

    function conf__cuadro(toba_ei_cuadro $cuadro) {
        if (!is_null($this->s__where)) {
            $datos = $this->dep('datos')->tabla($this->nombre_tabla)->get_acciones_x_objeto($this->s__where);
            $cuadro->set_datos($datos);
            
        } 
        
    }
    

}


