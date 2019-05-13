<?php
class descentralizado_abm_ci extends abm_ci
{
    /*agregar al atributo nombre_tabla la tabla sobre la que trabaja el ci */
    //private $nombre_tabla='';
    
    
    
    function chequeo_solo_lectura() {
        if(php_mocovi::instancia()->periodo_a_presupuestar_activo() ){
            $excepcion = true;
        } else {
            //print_r(toba::usuario()->get_perfiles_funcionales());
            $perfiles = toba::usuario()->get_perfiles_funcionales();

            //ei_arbol(toba::usuario()->get_restricciones_funcionales('admin'));
            $excepcion = false;
            foreach ($perfiles as $key => $value) {
                if ($value == 'excepcion') {
                    $excepcion = true;
                    break;
                }
            }
        }
        if (!$excepcion) {
            toba::notificacion()->agregar('Acceso de solo Lectura.  Se ha cerrado la carga de la informaci�n. ', 'info');
        }
        return !$excepcion;
    }
    

    function evt__nuevo($datos) {
        if (!$this->chequeo_solo_lectura()) {

            $this->set_pantalla('pant_edicion');
        }
    }

        
	function evt__cuadro__seleccion($datos)
	{
              if ($this->chequeo_solo_lectura()) {
                  $this->resetear();
              }else{
                  //--nuevo--
                  $band=true;
                  if($this->nombre_tabla=='mocovi_descentralizado_cargos'){
                      $tipo=$this->dep('datos')->tabla($this->nombre_tabla)->get_tipo($datos['id_cargo']);
                      if($tipo==1){//si es un servicio existente
                          $band=false;
                      }
                  }
                  if($band){
                    $this->set_pantalla('pant_edicion');
                    $this->dep('datos')->cargar($datos);
                  }else{
                      toba::notificacion()->agregar('No puede modificar el Servicio Existente precargado por Direccion de Presupuesto', 'info');
                  }
               
              }
	}

}
