------------------------------------------------------------
--[174]--  cargos 
------------------------------------------------------------

------------------------------------------------------------
-- apex_molde_operacion
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_molde_operacion (proyecto, molde, operacion_tipo, nombre, item, carpeta_archivos, prefijo_clases, fuente, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'10', --operacion_tipo
	'cargos', --nombre
	'3706', --item
	'cargos', --carpeta_archivos
	'_cargos', --prefijo_clases
	'descentralizado', --fuente
	'24'  --punto_montaje
);
--- FIN Grupo de desarrollo 0

------------------------------------------------------------
-- apex_molde_operacion_abms
------------------------------------------------------------
INSERT INTO apex_molde_operacion_abms (proyecto, molde, tabla, gen_usa_filtro, gen_separar_pantallas, filtro_comprobar_parametros, cuadro_eof, cuadro_eliminar_filas, cuadro_id, cuadro_forzar_filtro, cuadro_carga_origen, cuadro_carga_sql, cuadro_carga_php_include, cuadro_carga_php_clase, cuadro_carga_php_metodo, datos_tabla_validacion, apdb_pre, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'mocovi_descentralizado_cargos', --tabla
	'0', --gen_usa_filtro
	NULL, --gen_separar_pantallas
	NULL, --filtro_comprobar_parametros
	NULL, --cuadro_eof
	NULL, --cuadro_eliminar_filas
	'id_cargo', --cuadro_id
	NULL, --cuadro_forzar_filtro
	'datos_tabla', --cuadro_carga_origen
	'SELECT
	t_mdc.id_cargo,
	t_mpp.id_periodo as id_periodo_nombre,
	t_ua.descripcion as id_unidad_nombre,
	t_cs.descripcion as id_categoria_nombre,
	t_mp.nombre as id_programa_nombre,
	t_mdtg.tipo_gasto as id_tipo_gasto_nombre,
	t_e.descripcion as id_escalafon_nombre,
	t_mdc.cantidad,
	t_mdc.descripcion,
	t_mdc.contratado
FROM
	mocovi_descentralizado_cargos as t_mdc	LEFT OUTER JOIN mocovi_periodo_presupuestario as t_mpp ON (t_mdc.id_periodo = t_mpp.id_periodo)
	LEFT OUTER JOIN unidad_acad as t_ua ON (t_mdc.id_unidad = t_ua.sigla)
	LEFT OUTER JOIN categ_siu as t_cs ON (t_mdc.id_categoria = t_cs.codigo_siu)
	LEFT OUTER JOIN mocovi_programa as t_mp ON (t_mdc.id_programa = t_mp.id_programa)
	LEFT OUTER JOIN mocovi_descentralizado_tipo_gasto as t_mdtg ON (t_mdc.id_tipo_gasto = t_mdtg.id_tipo_gasto)
	LEFT OUTER JOIN escalafon as t_e ON (t_mdc.id_escalafon = t_e.id_escalafon)
ORDER BY descripcion', --cuadro_carga_sql
	NULL, --cuadro_carga_php_include
	NULL, --cuadro_carga_php_clase
	NULL, --cuadro_carga_php_metodo
	NULL, --datos_tabla_validacion
	NULL, --apdb_pre
	NULL  --punto_montaje
);

------------------------------------------------------------
-- apex_molde_operacion_abms_fila
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1718', --fila
	'1', --orden
	'id_cargo', --columna
	'1000003', --asistente_tipo_dato
	'Id Cargo', --etiqueta
	'0', --en_cuadro
	'0', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'0', --cuadro_estilo
	'7', --cuadro_formato
	'E', --dt_tipo_dato
	NULL, --dt_largo
	'mocovi_descentralizado_cargos_id_cargo_seq', --dt_secuencia
	'1', --dt_pk
	'ef_editable_numero', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	NULL, --ef_carga_origen
	NULL, --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	NULL, --ef_carga_tabla
	NULL, --ef_carga_col_clave
	NULL, --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1719', --fila
	'2', --orden
	'id_periodo', --columna
	'1000008', --asistente_tipo_dato
	'Id Periodo', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'4', --cuadro_estilo
	'1', --cuadro_formato
	'C', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_combo', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	'datos_tabla', --ef_carga_origen
	'SELECT id_periodo, id_periodo FROM mocovi_periodo_presupuestario ORDER BY id_periodo', --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	'mocovi_periodo_presupuestario', --ef_carga_tabla
	'id_periodo', --ef_carga_col_clave
	'id_periodo', --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1720', --fila
	'3', --orden
	'id_unidad', --columna
	'1000008', --asistente_tipo_dato
	'Id Unidad', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'4', --cuadro_estilo
	'1', --cuadro_formato
	'C', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_combo', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	'datos_tabla', --ef_carga_origen
	'SELECT sigla, descripcion FROM unidad_acad ORDER BY descripcion', --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	'unidad_acad', --ef_carga_tabla
	'sigla', --ef_carga_col_clave
	'descripcion', --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1721', --fila
	'4', --orden
	'id_categoria', --columna
	'1000008', --asistente_tipo_dato
	'Id Categoria', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'4', --cuadro_estilo
	'1', --cuadro_formato
	'C', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_combo', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	'datos_tabla', --ef_carga_origen
	'SELECT codigo_siu, descripcion FROM categ_siu ORDER BY descripcion', --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	'categ_siu', --ef_carga_tabla
	'codigo_siu', --ef_carga_col_clave
	'descripcion', --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1722', --fila
	'5', --orden
	'id_programa', --columna
	'1000008', --asistente_tipo_dato
	'Id Programa', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'4', --cuadro_estilo
	'1', --cuadro_formato
	'C', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_combo', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	'datos_tabla', --ef_carga_origen
	'SELECT id_programa, nombre FROM mocovi_programa ORDER BY nombre', --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	'mocovi_programa', --ef_carga_tabla
	'id_programa', --ef_carga_col_clave
	'nombre', --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1723', --fila
	'6', --orden
	'id_tipo_gasto', --columna
	'1000008', --asistente_tipo_dato
	'Id Tipo Gasto', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'4', --cuadro_estilo
	'1', --cuadro_formato
	'C', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_combo', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	'datos_tabla', --ef_carga_origen
	'SELECT id_tipo_gasto, tipo_gasto FROM mocovi_descentralizado_tipo_gasto ORDER BY tipo_gasto', --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	'mocovi_descentralizado_tipo_gasto', --ef_carga_tabla
	'id_tipo_gasto', --ef_carga_col_clave
	'tipo_gasto', --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1724', --fila
	'7', --orden
	'id_escalafon', --columna
	'1000008', --asistente_tipo_dato
	'Id Escalafon', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'4', --cuadro_estilo
	'1', --cuadro_formato
	'C', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_combo', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	'datos_tabla', --ef_carga_origen
	'SELECT id_escalafon, descripcion FROM escalafon ORDER BY descripcion', --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	'escalafon', --ef_carga_tabla
	'id_escalafon', --ef_carga_col_clave
	'descripcion', --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1725', --fila
	'8', --orden
	'cantidad', --columna
	'1000006', --asistente_tipo_dato
	'Cantidad', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'1', --cuadro_estilo
	'7', --cuadro_formato
	'N', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_editable_numero', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	NULL, --ef_carga_origen
	NULL, --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	NULL, --ef_carga_tabla
	NULL, --ef_carga_col_clave
	NULL, --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1726', --fila
	'9', --orden
	'descripcion', --columna
	'1000001', --asistente_tipo_dato
	'Descripcion', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'ILIKE', --filtro_operador
	'4', --cuadro_estilo
	'1', --cuadro_formato
	'C', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_editable', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	NULL, --ef_carga_origen
	NULL, --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	NULL, --ef_carga_tabla
	NULL, --ef_carga_col_clave
	NULL, --ef_carga_col_desc
	NULL  --punto_montaje
);
INSERT INTO apex_molde_operacion_abms_fila (proyecto, molde, fila, orden, columna, asistente_tipo_dato, etiqueta, en_cuadro, en_form, en_filtro, filtro_operador, cuadro_estilo, cuadro_formato, dt_tipo_dato, dt_largo, dt_secuencia, dt_pk, elemento_formulario, ef_obligatorio, ef_desactivar_modificacion, ef_procesar_javascript, ef_carga_origen, ef_carga_sql, ef_carga_php_include, ef_carga_php_clase, ef_carga_php_metodo, ef_carga_tabla, ef_carga_col_clave, ef_carga_col_desc, punto_montaje) VALUES (
	'descentralizado', --proyecto
	'174', --molde
	'1727', --fila
	'10', --orden
	'contratado', --columna
	'1000005', --asistente_tipo_dato
	'Contratado', --etiqueta
	'1', --en_cuadro
	'1', --en_form
	'0', --en_filtro
	'=', --filtro_operador
	'7', --cuadro_estilo
	'13', --cuadro_formato
	'L', --dt_tipo_dato
	NULL, --dt_largo
	'', --dt_secuencia
	'0', --dt_pk
	'ef_checkbox', --elemento_formulario
	'0', --ef_obligatorio
	NULL, --ef_desactivar_modificacion
	NULL, --ef_procesar_javascript
	NULL, --ef_carga_origen
	NULL, --ef_carga_sql
	NULL, --ef_carga_php_include
	NULL, --ef_carga_php_clase
	NULL, --ef_carga_php_metodo
	NULL, --ef_carga_tabla
	NULL, --ef_carga_col_clave
	NULL, --ef_carga_col_desc
	NULL  --punto_montaje
);
--- FIN Grupo de desarrollo 0
