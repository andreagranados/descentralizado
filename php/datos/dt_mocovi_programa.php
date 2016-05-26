<?php
class dt_mocovi_programa extends toba_datos_tabla
{
		function get_descripciones($sigla=NULL)
		{
                    if(!is_null($sigla)){
                        $where="Where id_unidad='$sigla'";
                    }else{
                        $where='';
                    }
                        
			$sql = "SELECT id_programa, nombre FROM mocovi_programa $where ORDER BY nombre";
			return toba::db('descentralizado')->consultar($sql);
		}
		function get_descripciones_propias($sigla=NULL)
		{
                    if(!is_null($sigla)){
                        $where="Where id_unidad='$sigla'";
                    }else{
                        $where='';
                    }
                        
			$sql = "SELECT id_programa, nombre FROM mocovi_programa $where ORDER BY nombre";
                        $sql = $sql=toba::perfil_de_datos()->filtrar($sql);
			return toba::db('descentralizado')->consultar($sql);
		}








}
?>