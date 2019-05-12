insert into mocovi_descentralizado_permutas(id_tipo_permuta,id_tipo_gasto,id_periodo,id_escalafon,id_categoria,id_unidad,id_programa,id_unidad_permuta,id_programa_permuta,cantidad,descripcion)
select id_tipo_permuta,id_tipo_gasto,3,id_escalafon,id_categoria,id_unidad,id_programa,id_unidad_permuta,id_programa_permuta,cantidad,descripcion  || ' IMPORTADO anteproyecto 2016' as descripcion from mocovi_descentralizado_permutas
where id_unidad='FAEA' and id_periodo=2
