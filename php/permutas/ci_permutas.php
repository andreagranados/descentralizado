<?php
class ci_permutas extends descentralizado_abm_ci
{
    protected $nombre_tabla = 'mocovi_descentralizado_permutas';
    
     public function evt__formulario__alta($datos) {
        $datos['id_escalafon']='D';
        parent::evt__formulario__alta($datos);
}
public function evt__formulario__modificacion($datos) {
    $datos['id_escalafon']='D';
    parent::evt__formulario__modificacion($datos);
}
}
