<?php
class ci_informe_general extends  abm_ci
{
    
    public $nombre_tabla = 'mocovi_presupuesto_general';

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
        //ei_arbol($datos);
        $this->dep('datos')->tabla($this->nombre_tabla)->set($datos);
        $this->dep('datos')->sincronizar();
        $this->resetear();
    }
     public function evt__formulario__alta($datos) {
        $datos['inciso']=5835;//Bienes de Uso
        $datos['id_objeto_del_gasto']=34;//construcciones
        
        parent::evt__formulario__alta($datos);
    }
    
    public function evt__formulario__modificacion($datos) {
       $datos['inciso']=5835;//Bienes de Uso
        $datos['id_objeto_del_gasto']=34;//construcciones
        
        parent::evt__formulario__modificacion($datos);
    }
}


