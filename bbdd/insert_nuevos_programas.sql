insert into mocovi_programa (id_unidad,id_tipo_programa,nombre,area,sub_area,sub_sub_area,fuente)
select sigla, tp.id_tipo_programa, concat(tp.tipo,' ',sigla),null,null,null,11
from unidad_acad, mocovi_tipo_programa tp
where id_tipo_dependencia in (2,3) and tp.id_tipo_programa in(11,12,13,14);


insert into mocovi_programa (id_unidad,id_tipo_programa,nombre,area,sub_area,sub_sub_area,fuente)
select sigla, tp.id_tipo_programa, concat(tp.tipo,' ',sigla),null,null,null,11
from unidad_acad, mocovi_tipo_programa tp
where id_tipo_dependencia in (1) and tp.id_tipo_programa in(15,16);