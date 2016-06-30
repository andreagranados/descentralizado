
------------------------------------------------------------
-- apex_dimension
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_dimension (proyecto, dimension, nombre, descripcion, schema, tabla, col_id, col_desc, col_desc_separador, multitabla_col_tabla, multitabla_id_tabla, fuente_datos_proyecto, fuente_datos) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'Dependencia', --nombre
	NULL, --descripcion
	NULL, --schema
	'unidad_acad', --tabla
	'sigla', --col_id
	'sigla', --col_desc
	NULL, --col_desc_separador
	NULL, --multitabla_col_tabla
	NULL, --multitabla_id_tabla
	'descentralizado', --fuente_datos_proyecto
	'descentralizado'  --fuente_datos
);
INSERT INTO apex_dimension (proyecto, dimension, nombre, descripcion, schema, tabla, col_id, col_desc, col_desc_separador, multitabla_col_tabla, multitabla_id_tabla, fuente_datos_proyecto, fuente_datos) VALUES (
	'descentralizado', --proyecto
	'16', --dimension
	'Escalafon', --nombre
	NULL, --descripcion
	NULL, --schema
	'escalafon', --tabla
	'id_escalafon', --col_id
	'descripcion', --col_desc
	NULL, --col_desc_separador
	NULL, --multitabla_col_tabla
	NULL, --multitabla_id_tabla
	'descentralizado', --fuente_datos_proyecto
	'descentralizado'  --fuente_datos
);
INSERT INTO apex_dimension (proyecto, dimension, nombre, descripcion, schema, tabla, col_id, col_desc, col_desc_separador, multitabla_col_tabla, multitabla_id_tabla, fuente_datos_proyecto, fuente_datos) VALUES (
	'descentralizado', --proyecto
	'17', --dimension
	'Tipo_gasto', --nombre
	NULL, --descripcion
	NULL, --schema
	'mocovi_descentralizado_tipo_gasto', --tabla
	'id_tipo_gasto', --col_id
	'tipo_gasto', --col_desc
	NULL, --col_desc_separador
	NULL, --multitabla_col_tabla
	NULL, --multitabla_id_tabla
	'descentralizado', --fuente_datos_proyecto
	'descentralizado'  --fuente_datos
);
--- FIN Grupo de desarrollo 0
