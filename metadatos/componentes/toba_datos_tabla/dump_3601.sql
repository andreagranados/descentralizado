------------------------------------------------------------
--[3601]--  DT - mocovi_descentralizado_fuente 
------------------------------------------------------------

------------------------------------------------------------
-- apex_objeto
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_objeto (proyecto, objeto, anterior, identificador, reflexivo, clase_proyecto, clase, punto_montaje, subclase, subclase_archivo, objeto_categoria_proyecto, objeto_categoria, nombre, titulo, colapsable, descripcion, fuente_datos_proyecto, fuente_datos, solicitud_registrar, solicitud_obj_obs_tipo, solicitud_obj_observacion, parametro_a, parametro_b, parametro_c, parametro_d, parametro_e, parametro_f, usuario, creacion, posicion_botonera) VALUES (
	'descentralizado', --proyecto
	'3601', --objeto
	NULL, --anterior
	NULL, --identificador
	NULL, --reflexivo
	'toba', --clase_proyecto
	'toba_datos_tabla', --clase
	'24', --punto_montaje
	'dt_mocovi_descentralizado_fuente', --subclase
	'datos/dt_mocovi_descentralizado_fuente.php', --subclase_archivo
	NULL, --objeto_categoria_proyecto
	NULL, --objeto_categoria
	'DT - mocovi_descentralizado_fuente', --nombre
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
	'2016-05-15 19:12:13', --creacion
	NULL  --posicion_botonera
);
--- FIN Grupo de desarrollo 0

------------------------------------------------------------
-- apex_objeto_db_registros
------------------------------------------------------------
INSERT INTO apex_objeto_db_registros (objeto_proyecto, objeto, max_registros, min_registros, punto_montaje, ap, ap_clase, ap_archivo, tabla, tabla_ext, alias, modificar_claves, fuente_datos_proyecto, fuente_datos, permite_actualizacion_automatica, esquema, esquema_ext) VALUES (
	'descentralizado', --objeto_proyecto
	'3601', --objeto
	NULL, --max_registros
	NULL, --min_registros
	'24', --punto_montaje
	'1', --ap
	NULL, --ap_clase
	NULL, --ap_archivo
	'mocovi_descentralizado_fuente', --tabla
	NULL, --tabla_ext
	NULL, --alias
	'0', --modificar_claves
	'descentralizado', --fuente_datos_proyecto
	'descentralizado', --fuente_datos
	'1', --permite_actualizacion_automatica
	'public', --esquema
	'public'  --esquema_ext
);

------------------------------------------------------------
-- apex_objeto_db_registros_col
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3601', --objeto
	'1536', --col_id
	'id_fuente', --columna
	'E', --tipo
	'1', --pk
	'mocovi_descentralizado_tipo_ingresos_id_tipo_ingresos_seq', --secuencia
	NULL, --largo
	NULL, --no_nulo
	'1', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_fuente'  --tabla
);
INSERT INTO apex_objeto_db_registros_col (objeto_proyecto, objeto, col_id, columna, tipo, pk, secuencia, largo, no_nulo, no_nulo_db, externa, tabla) VALUES (
	'descentralizado', --objeto_proyecto
	'3601', --objeto
	'1537', --col_id
	'tipo', --columna
	'C', --tipo
	'0', --pk
	'', --secuencia
	'20', --largo
	NULL, --no_nulo
	'0', --no_nulo_db
	'0', --externa
	'mocovi_descentralizado_fuente'  --tabla
);
--- FIN Grupo de desarrollo 0
