
------------------------------------------------------------
-- apex_dimension_gatillo
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'21', --gatillo
	'directo', --tipo
	'1', --orden
	'unidad_acad', --tabla_rel_dim
	'sigla', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'22', --gatillo
	'directo', --tipo
	'2', --orden
	'mocovi_descentralizado_ingresos', --tabla_rel_dim
	'id_unidad', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'23', --gatillo
	'directo', --tipo
	'3', --orden
	'mocovi_descentralizado_cargos', --tabla_rel_dim
	'id_unidad', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'24', --gatillo
	'directo', --tipo
	'4', --orden
	'mocovi_descentralizado_presupuesto_general', --tabla_rel_dim
	'id_unidad', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'25', --gatillo
	'directo', --tipo
	'5', --orden
	'mocovi_descentralizado_politica', --tabla_rel_dim
	'id_unidad', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'26', --gatillo
	'directo', --tipo
	'6', --orden
	'mocovi_descentralizado_permutas', --tabla_rel_dim
	'id_unidad', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'15', --dimension
	'27', --gatillo
	'directo', --tipo
	'7', --orden
	'mocovi_programa', --tabla_rel_dim
	'id_unidad', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'16', --dimension
	'28', --gatillo
	'directo', --tipo
	'1', --orden
	'escalafon', --tabla_rel_dim
	'id_escalafon', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'16', --dimension
	'29', --gatillo
	'directo', --tipo
	'2', --orden
	'mocovi_descentralizado_cargos', --tabla_rel_dim
	'id_escalafon', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'17', --dimension
	'30', --gatillo
	'directo', --tipo
	'1', --orden
	'mocovi_descentralizado_tipo_gasto', --tabla_rel_dim
	'id_tipo_gasto', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
INSERT INTO apex_dimension_gatillo (proyecto, dimension, gatillo, tipo, orden, tabla_rel_dim, columnas_rel_dim, tabla_gatillo, ruta_tabla_rel_dim) VALUES (
	'descentralizado', --proyecto
	'17', --dimension
	'31', --gatillo
	'directo', --tipo
	'2', --orden
	'mocovi_descentralizado_cargos', --tabla_rel_dim
	'id_tipo_gasto', --columnas_rel_dim
	NULL, --tabla_gatillo
	NULL  --ruta_tabla_rel_dim
);
--- FIN Grupo de desarrollo 0
