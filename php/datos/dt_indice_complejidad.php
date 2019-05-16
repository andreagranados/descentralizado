<?php
class dt_indice_complejidad extends toba_datos_tabla
{
	function get_listado($where = null)
	{
            if (is_null($where)) {
                $where = 'where id_periodo=' . $id_periodo_actual;
            } else {
                $where = ' where ' . $where;
            }
            //$sql = "SELECT * FROM indice_complejidad";
            $sql="select subp.*,(vd*0.2+va*0.3+vm*0.3+ve*0.2)as porc from 
(select i.id_unidad,cant_doc_simples, cant_doc_parcial, cant_doc_exclusiva,trunc((cant_doc_simples*10+cant_doc_parcial*20+ cant_doc_exclusiva*40)/40,2) as doc_exc,sub2.total_exc,((cant_doc_simples*10+cant_doc_parcial*20+ cant_doc_exclusiva*40)/40)/sub2.total_exc*100 as VD,reinscriptos, ingresantes, aspirantes,
(reinscriptos+ingresantes + aspirantes*0.5) as alumnos,sub3.total_alumnos,(reinscriptos+ingresantes + aspirantes*0.5)/total_alumnos*100 as VA,metros_cubiertos, metros_laboratorios, 
            metros_nocubiertos,trunc((metros_cubiertos*0.3+ metros_laboratorios*0.6+ metros_nocubiertos*0.1),2) as metros,sub4.total_metros,((metros_cubiertos*0.3+ metros_laboratorios*0.6+ metros_nocubiertos*0.1)/sub4.total_metros*100) as VM,acti_extraaulica, distancia_a_cede,acti_extraaulica+ distancia_a_cede as ae,sub5.total_e,(acti_extraaulica+distancia_a_cede)/sub5.total_e*100 as ve
from indice_complejidad i
left outer join (select id_periodo, sum((cant_doc_simples*10+cant_doc_parcial*20+ cant_doc_exclusiva*40)/40) as total_exc
                 from indice_complejidad
                 group by id_periodo)sub2 on (i.id_periodo=sub2.id_periodo)
left outer join (select id_periodo, sum((reinscriptos+ingresantes + aspirantes*0.5)) as total_alumnos
                 from indice_complejidad
                 group by id_periodo)sub3 on (i.id_periodo=sub3.id_periodo)                 
left outer join (select id_periodo, sum(metros_cubiertos*0.3+ metros_laboratorios*0.6+ metros_nocubiertos*0.1) as total_metros
                 from indice_complejidad
                 group by id_periodo)sub4 on (i.id_periodo=sub4.id_periodo)  
left outer join (select id_periodo, sum(acti_extraaulica+ distancia_a_cede) as total_e
                 from indice_complejidad
                 group by id_periodo)sub5 on (i.id_periodo=sub5.id_periodo)                                    
$where)subp ";
            return toba::db('descentralizado')->consultar($sql);
	}



}
?>