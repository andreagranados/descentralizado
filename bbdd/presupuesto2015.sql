 
select concat('(2,1,11,',CASE WHEN pr.id_programa IS NULL THEN 0 ELSE pr.id_programa END,',"',codigo,'",',id_objeto_del_gasto,',',monto,',',inciso,',"',descripcion,'"),')
from presupuesto_general p inner join unidad u on p.id_unidad=u.id_unidad
left outer join mocovi_programa pr on u.codigo=pr.id_unidad and id_tipo_programa =(select min(id_tipo_programa)  from mocovi_programa pr2 where u.codigo=pr2.id_unidad)
