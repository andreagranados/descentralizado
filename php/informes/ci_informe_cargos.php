<?php
class ci_informe_cargos extends  abm_ci
{
    
    public $nombre_tabla = 'mocovi_descentralizado_cargos';

    function conf__cuadro(toba_ei_cuadro $cuadro) {
        if (!is_null($this->s__where)) {
            $datos = $this->dep('datos')->tabla($this->nombre_tabla)->get_listado($this->s__where);
            $cuadro->set_datos($datos);
            
        } 
        
    }
    
    function evt__cuadro__check($datos) {
        
        $this->dep('datos')->cargar($datos);

        $datos=$this->dep('datos')->tabla($this->nombre_tabla)->get();
        $datos['ck']=!$datos['ck'];
        $this->dep('datos')->tabla($this->nombre_tabla)->set($datos);
        $this->dep('datos')->sincronizar();
       // $this->resetear();
    }

}


