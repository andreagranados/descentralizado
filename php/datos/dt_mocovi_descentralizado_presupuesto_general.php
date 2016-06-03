<?php

class dt_mocovi_descentralizado_presupuesto_general extends toba_datos_tabla {

    function get_listado($where=null) {

        $id_periodo_actual = php_mocovi::instancia()->periodo_a_presupuestar();
        $sql = "
                Delete from mocovi_descentralizado_presupuesto_general where id_periodo=$id_periodo_actual 
-- actual 2017
  and id_objeto_del_gasto in (4,5,6,80);

 insert into mocovi_descentralizado_presupuesto_general (id_periodo,id_unidad,id_programa, id_tipo_gasto, id_fuente,inciso,id_objeto_del_gasto,monto)
  Select pc.id_periodo,pc.id_unidad,pc.id_programa,pc.id_tipo_gasto,pc.id_fuente,
 5832 as inciso,
  case pc.id_escalafon
  when 'D' Then 4
  when 'N' Then 5
  when 'S' Then 6
  when 'C' Then 80
  end as id_objeto_del_gasto 
 ,sum(cc.costo_costo*pc.cantidad*13)
   from
(
select id_periodo,id_unidad,id_programa,id_tipo_gasto,id_fuente,id_escalafon,id_categoria,sum(cantidad) as cantidad
from (
select id_cargo,id_periodo,id_unidad,id_programa,id_tipo_gasto,id_fuente,id_escalafon, id_categoria,cantidad
from mocovi_descentralizado_cargos
where id_periodo=$id_periodo_actual and not contratado
Union
select id_cargo,id_periodo,id_unidad,id_programa,id_tipo_gasto,id_fuente,'C', id_categoria,cantidad
from mocovi_descentralizado_cargos
where id_periodo=$id_periodo_actual and  contratado
Union
select id_permutas,id_periodo,id_unidad,id_programa,id_tipo_gasto,11,id_escalafon,id_categoria,cantidad  as cantidad
from mocovi_descentralizado_permutas
where id_tipo_permuta=1 --Cede
and id_periodo=$id_periodo_actual
Union
select id_permutas,id_periodo,id_unidad,id_programa,id_tipo_gasto,11,id_escalafon,id_categoria,cantidad * (-1) as cantidad
from mocovi_descentralizado_permutas
where id_tipo_permuta=2 --Recibe
and id_periodo=$id_periodo_actual

) a


group by id_periodo,id_escalafon,id_unidad,id_programa,id_tipo_gasto,id_fuente,id_categoria
--order by id_periodo,id_escalafon,id_unidad,id_categoria
) pc
inner join mocovi_costo_categoria cc on pc.id_periodo=cc.id_periodo and pc.id_categoria=cc.codigo_siu
--inner join escalafon e on pc.id_escalafon=e.id_escalafon

group by pc.id_periodo,pc.id_unidad,pc.id_programa,pc.id_tipo_gasto,pc.id_fuente,pc.id_escalafon";

        toba::db('descentralizado')->ejecutar($sql);
 
        if (is_null($where)) {
            $where = 'where t_p.id_periodo='.$id_periodo_actual;
        } else {
            $where = ' where ' . $where;
        }

        $sql = "SELECT
			t_p.id_presupuesto,
                        t_p.descripcion,
			t_p1.anio as id_periodo_nombre,
                        t_tg.tipo_gasto as tipo_gasto,
			t_p.id_unidad as id_unidad_nombre,
                        t_pp.nombre as id_programa_nombre,
                        t_odg2.nombre as inciso_nombre,
                        t_odg2.codigo as inciso_codigo,
                        t_odg.codigo_completo,
			t_odg.nombre as id_objeto_del_gasto_nombre,
                        t_p.id_fuente,
			t_p.monto
		FROM
			mocovi_descentralizado_presupuesto_general as t_p
                        inner JOIN mocovi_periodo_presupuestario as t_p1 ON (t_p.id_periodo = t_p1.id_periodo)
			--inner JOIN unidad_acad as t_u ON (t_p.id_unidad = t_u.sigla)
                        inner join mocovi_programa as t_pp on (t_p.id_programa = t_pp.id_programa)
                        inner join mocovi_descentralizado_tipo_gasto as t_tg on (t_p.id_tipo_gasto=t_tg.id_tipo_gasto)
			LEFT OUTER JOIN mocovi_descentralizado_objeto_del_gasto as t_odg ON (t_p.id_objeto_del_gasto = t_odg.id_objeto_del_gasto)
                        Left outer join mocovi_descentralizado_objeto_del_gasto as t_odg2 on t_odg.elemento_padre=t_odg2.elemento
                        $where
                        order by t_odg.codigo_completo";
        $sql = toba::perfil_de_datos()->filtrar($sql);

        


        return toba::db('descentralizado')->consultar($sql);
    }

}

?>