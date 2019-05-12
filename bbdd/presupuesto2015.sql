gastos
select concat('(2,1,11,',CASE WHEN pr.id_programa IS NULL THEN 0 ELSE pr.id_programa END,',"',codigo,'",',id_objeto_del_gasto,',',monto,',',inciso,',"',descripcion,'"),')
from presupuesto_general p inner join unidad u on p.id_unidad=u.id_unidad
left outer join mocovi_programa pr on u.codigo=pr.id_unidad and id_tipo_programa =(select min(id_tipo_programa)  from mocovi_programa pr2 where u.codigo=pr2.id_unidad)

cargos
select concat('(2,1,11,',CASE WHEN pr.id_programa IS NULL THEN 0 ELSE pr.id_programa END,',"',u.codigo,'","',e.codigo,'","',codigo_siu,'",',cantidad,',"',descripcion,'"),')
from presupuesto_cargos p inner join categoria c on p.id_categoria=c.id_categoria
inner join escalafon e on p.id_escalafon=e.id_escalafon
inner join unidad u on p.id_unidad=u.id_unidad
left outer join mocovi_programa pr on u.codigo=pr.id_unidad and id_tipo_programa =(select min(id_tipo_programa)  from mocovi_programa pr2 where u.codigo=pr2.id_unidad)



permutas

select concat('(2,1,',p.id_tipo_permuta,',',CASE WHEN pr.id_programa IS NULL THEN 0 ELSE pr.id_programa END,',"',u.codigo,'",',CASE WHEN pr2.id_programa IS NULL THEN 0 ELSE pr2.id_programa END,',"',u2.codigo,'","',e.codigo,'","',codigo_siu,'",',cantidad,',"',descripcion,'"),')
from presupuesto_permutas p inner join categoria c on p.id_categoria=c.id_categoria
inner join escalafon e on p.id_escalafon=e.id_escalafon
inner join unidad u on p.id_unidad=u.id_unidad
inner join unidad u2 on p.id_unidad_permuta=u2.id_unidad
left outer join mocovi_programa pr on u.codigo=pr.id_unidad and pr.id_tipo_programa =(select min(id_tipo_programa)  from mocovi_programa pr12 where u.codigo=pr12.id_unidad)
left outer join mocovi_programa pr2 on u2.codigo=pr2.id_unidad and pr2.id_tipo_programa =(select min(id_tipo_programa)  from mocovi_programa pr22 where u2.codigo=pr22.id_unidad)

select count(*) from presupuesto_permutas