
------------------------------------------------------------
-- apex_usuario_grupo_acc
------------------------------------------------------------
INSERT INTO apex_usuario_grupo_acc (proyecto, usuario_grupo_acc, nombre, nivel_acceso, descripcion, vencimiento, dias, hora_entrada, hora_salida, listar, permite_edicion, menu_usuario) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	'Consulta', --nombre
	NULL, --nivel_acceso
	NULL, --descripcion
	NULL, --vencimiento
	NULL, --dias
	NULL, --hora_entrada
	NULL, --hora_salida
	NULL, --listar
	'0', --permite_edicion
	NULL  --menu_usuario
);

------------------------------------------------------------
-- apex_usuario_grupo_acc_item
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'1'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'2'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3711'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3712'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3713'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3719'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3720'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3721'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3722'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3723'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3724'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3821'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3822'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3846'  --item
);
INSERT INTO apex_usuario_grupo_acc_item (proyecto, usuario_grupo_acc, item_id, item) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	NULL, --item_id
	'3851'  --item
);
--- FIN Grupo de desarrollo 0

------------------------------------------------------------
-- apex_grupo_acc_restriccion_funcional
------------------------------------------------------------
INSERT INTO apex_grupo_acc_restriccion_funcional (proyecto, usuario_grupo_acc, restriccion_funcional) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	'2'  --restriccion_funcional
);
INSERT INTO apex_grupo_acc_restriccion_funcional (proyecto, usuario_grupo_acc, restriccion_funcional) VALUES (
	'descentralizado', --proyecto
	'consulta', --usuario_grupo_acc
	'3'  --restriccion_funcional
);
