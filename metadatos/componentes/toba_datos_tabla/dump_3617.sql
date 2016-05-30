------------------------------------------------------------
--[3617]--  DT - mocovi_descentralizado_objeto_del_gasto 
------------------------------------------------------------

------------------------------------------------------------
-- apex_objeto
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_objeto (proyecto, objeto, anterior, identificador, reflexivo, clase_proyecto, clase, punto_montaje, subclase, subclase_archivo, objeto_categoria_proyecto, objeto_categoria, nombre, titulo, colapsable, descripcion, fuente_datos_proyecto, fuente_datos, solicitud_registrar, solicitud_obj_obs_tipo, solicitud_obj_observacion, parametro_a, parametro_b, parametro_c, parametro_d, parametro_e, parametro_f, usuario, creacion, posicion_botonera) VALUES (
	'descentralizado', --proyecto
	'3617', --objeto
	NULL, --anterior
	NULL, --identificador
	NULL, --reflexivo
	'toba', --clase_proyecto
	'toba_datos_tabla', --clase
	'24', --punto_montaje
	'dt_mocovi_descentralizado_objeto_del_gasto', --subclase
	'datos/dt_mocovi_descentralizado_objeto_del_gasto.php', --subclase_archivo
	NULL, --objeto_categoria_proyecto
	NULL, --objeto_categoria
	'DT - mocovi_descentralizado_objeto_del_gasto', --nombre
	NULL, --titulo
	NULL, --colapsable
	NULL, --descripcion
	'descentralizado', --fuente_datos_proyecto
	'descentralizado', --fuente_datos
	NULL, --solicitud_registrar
	NULL, --solicitud_obj_obs_tipo
	NULL, --solicitud_obj_observacion
	NULL, --parametro_a
	NULL, --parametro_b
	NULL, --parametro_c
	NULL, --parametro_d
	NULL, --parametro_e
	NULL, --parametro_f
	NULL, --usuario
	'2016-05-16 15:49:10', --creacion
	NULL  --posicion_botonera
);
--- FIN Grupo de desarrollo 0

------------------------------------------------------------
-- apex_objeto_db_registros
------------------------------------------------------------
INSERT INTO apex_objeto_db_registros (objeto_proyecto, objeto, max_registros, min_registros, punto_montaje, ap, ap_clase, ap_archivo, tabla, tabla_ext, alias, modificar_claves, fuente_datos_proyecto, fuente_datos, permite_actualizacion_automatica, esquema, esquema_ext) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	NULL, --max_registros
	NULL, --min_registros
	'24', --punto_montaje
	'1', --ap
	NULL, --ap_clase
	NULL, --ap_archivo
	'mocovi_descentralizado_objeto_del_gasto', --tabla
	NULL, --tabla_ext
	NULL, --alias
	'0', --modificar_claves
	'descentralizado', --fuente_datos_proyecto
	'descentralizado', --fuente_datos
	'1', --permite_actualizacion_automatica
	NULL, --esquema
	'public'  --esquema_ext
);

------------------------------------------------------------
-- apex_objeto_db_registros_col
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1527', --col_id
	'id_objeto_del_gasto', --columna
	'E', --tipo
	'1', --pk
	'mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'1', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1528', --col_id
	'codigo_completo', --columna
	'C', --tipo
	'0', --pk
	'', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1529', --col_id
	'nombre', --columna
	'C', --tipo
	'0', --pk
	'', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1530', --col_id
	'elemento_padre', --columna
	'E', --tipo
	'0', --pk
	'', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1531', --col_id
	'elemento', --columna
	'E', --tipo
	'0', --pk
	'', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1532', --col_id
	'componente', --columna
	'C', --tipo
	'0', --pk
	'', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1533', --col_id
	'codigo', --columna
	'E', --tipo
	'0', --pk
	'', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3617', --objeto
	'1534', --col_id
	'presupuestable', --columna
	'L', --tipo
	'0', --pk
	'', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_objeto_del_gasto'  --tabla
);
--- FIN Grupo de desarrollo 0
