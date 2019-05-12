
-- -----------------------------------
-- "public"."categ_siu"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."categ_siu" CASCADE;
CREATE TABLE "public"."categ_siu" (
	"codigo_siu" CHARACTER(4) NOT NULL DEFAULT ''::bpchar,
	"descripcion" CHARACTER(45) NOT NULL DEFAULT ''::bpchar,
	"escalafon" CHARACTER(1),
	PRIMARY KEY ( "codigo_siu" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_costo_categoria"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_costo_categoria" CASCADE;
CREATE TABLE "public"."mocovi_costo_categoria" (
	"id_costo_categoria" SERIAL NOT NULL,
	"id_periodo" INTEGER,
	"codigo_siu" CHARACTER(4),
	"costo_basico" NUMERIC,
	"costo_diario" NUMERIC,
	PRIMARY KEY ( "id_costo_categoria" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_periodo_presupuestario"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_periodo_presupuestario" CASCADE;
CREATE TABLE "public"."mocovi_periodo_presupuestario" (
	"id_periodo" SERIAL NOT NULL,
	"anio" INTEGER,
	"fecha_inicio" DATE,
	"fecha_fin" DATE,
	"fecha_ultima_liquidacion" DATE,
	"actual" BOOLEAN,
	"id_liqui_ini" INTEGER,
	"id_liqui_fin" INTEGER,
	"id_liqui_1sac" INTEGER,
	"id_liqui_2sac" INTEGER,
	"presupuestando" BOOLEAN,
	"activo_para_carga_presupuestando" BOOLEAN,
	PRIMARY KEY ( "id_periodo" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_programa"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_programa" CASCADE;
CREATE TABLE "public"."mocovi_programa" (
	"id_programa" SERIAL NOT NULL,
	"id_unidad" CHARACTER(5),
	"id_tipo_programa" INTEGER,
	"nombre" CHARACTER VARYING,
	"area" INTEGER,
	"sub_area" INTEGER,
	"sub_sub_area" INTEGER,
	"fuente" INTEGER,
	"imputacion" CHARACTER VARYING,
	PRIMARY KEY ( "id_programa" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_tipo_programa"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_tipo_programa" CASCADE;
CREATE TABLE "public"."mocovi_tipo_programa" (
	"id_tipo_programa" INTEGER NOT NULL,
	"tipo" CHARACTER VARYING,
	PRIMARY KEY ( "id_tipo_programa" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_tipo_dependencia"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_tipo_dependencia" CASCADE;
CREATE TABLE "public"."mocovi_tipo_dependencia" (
	"id_tipo_dependencia" SERIAL NOT NULL,
	"tipo" CHARACTER(60) NOT NULL,
	PRIMARY KEY ( "id_tipo_dependencia" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."unidad_acad"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."unidad_acad" CASCADE;
CREATE TABLE "public"."unidad_acad" (
	"sigla" CHARACTER(5) NOT NULL,
	"descripcion" CHARACTER(60) NOT NULL,
	"nro_tab6" INTEGER,
	"cod_regional" CHARACTER(4),
	"id_tipo_dependencia" INTEGER,
	PRIMARY KEY ( "sigla" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_politica"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_politica" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_politica" (
	"id_politica" SERIAL,
	"id_periodo" INTEGER,
	"id_unidad" CHARACTER(5),
	"politica" CHARACTER VARYING,
	PRIMARY KEY ( "id_politica" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_ingresos"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_ingresos" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_ingresos" (
	"id_ingresos" SERIAL,
	"id_periodo" INTEGER,
	"id_unidad" CHARACTER(5),
	"id_tipo_ingreso" INTEGER,
	"descripcion" CHARACTER VARYING,
	"monto" NUMERIC,
	PRIMARY KEY ( "id_ingresos" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_tipo_ingresos"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_tipo_ingresos" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_tipo_ingresos" (
	"id_tipo_ingresos" SERIAL,
	"tipo" CHARACTER(20),
	PRIMARY KEY ( "id_tipo_ingresos" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_cargos"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_cargos" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_cargos" (
	"id_cargo" SERIAL,
	"id_periodo" INTEGER,
	"id_unidad" CHARACTER(5),
	"id_categoria" CHARACTER(4),
	"id_programa" INTEGER,
	"id_tipo_gasto" INTEGER,
	"id_escalafon" CHARACTER(1),
	"cantidad" NUMERIC,
	"descripcion" CHARACTER VARYING,
	"contratado" BOOLEAN,
	PRIMARY KEY ( "id_cargo" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_permutas"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_permutas" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_permutas" (
	"id_permutas" SERIAL,
	"id_tipo_permuta" INTEGER,
	"id_tipo_gasto" INTEGER,
	"id_periodo" INTEGER,
	"id_escalafon" CHARACTER(1),
	"id_categoria" CHARACTER(4),
	"id_unidad" CHARACTER(5),
	"id_programa" INTEGER,
	"id_unidad_permuta" CHARACTER(5),
	"id_programa_permuta" INTEGER,
	"cantidad" NUMERIC,
	"descripcion" CHARACTER VARYING,
	PRIMARY KEY ( "id_permutas" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_presupuesto_general"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_presupuesto_general" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_presupuesto_general" (
	"id_prespuesto" SERIAL,
	"id_periodo" INTEGER,
	"id_unidad" CHARACTER(5),
	"id_objeto_del_gasto" INTEGER,
	"id_tipo_gasto" INTEGER,
	"id_programa" INTEGER,
	"monto" NUMERIC,
	"inciso" INTEGER,
	"descripcion" CHARACTER VARYING,
	PRIMARY KEY ( "id_prespuesto" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_objeto_del_gasto"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_objeto_del_gasto" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_objeto_del_gasto" (
	"id_objeto_del_gasto" SERIAL,
	"codigo_completo" CHARACTER VARYING,
	"nombre" CHARACTER VARYING,
	"elemento_padre" INTEGER,
	"elemento" INTEGER,
	"componente" CHARACTER VARYING,
	"codigo" INTEGER,
	"presupuestable" BOOLEAN,
	PRIMARY KEY ( "id_objeto_del_gasto" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_tipo_gasto"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_tipo_gasto" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_tipo_gasto" (
	"id_tipo_gasto" SERIAL,
	"tipo_gasto" CHARACTER(20),
	PRIMARY KEY ( "id_tipo_gasto" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."escalafon"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."escalafon" CASCADE;
CREATE TABLE "public"."escalafon" (
	"id_escalafon" CHARACTER(1) NOT NULL,
	"descripcion" CHARACTER(15) NOT NULL,
	PRIMARY KEY ( "id_escalafon" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- "public"."mocovi_descentralizado_tipo_permuta"
-- -----------------------------------

DROP TABLE IF EXISTS "public"."mocovi_descentralizado_tipo_permuta" CASCADE;
CREATE TABLE "public"."mocovi_descentralizado_tipo_permuta" (
	"id_tipo_permuta" SERIAL,
	"tipo_permuta" CHARACTER VARYING,
	PRIMARY KEY ( "id_tipo_permuta" )
)
WITH ( OIDS=FALSE );

-- -----------------------------------
-- Foreign Keys
-- -----------------------------------

ALTER TABLE "public"."mocovi_costo_categoria"
	ADD CONSTRAINT "fk_costo_categoria_periodo" FOREIGN KEY ( "id_periodo" ) REFERENCES "public"."mocovi_periodo_presupuestario" ( "id_periodo" )
	ON DELETE NO ACTION ON UPDATE NO ACTION
	DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "public"."mocovi_costo_categoria"
	ADD CONSTRAINT "fk_costo_categoria_siu" FOREIGN KEY ( "codigo_siu" ) REFERENCES "public"."categ_siu" ( "codigo_siu" )
	ON DELETE NO ACTION ON UPDATE NO ACTION
	DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "public"."mocovi_programa"
	ADD CONSTRAINT "fk_programa_tipo_programa" FOREIGN KEY ( "id_tipo_programa" ) REFERENCES "public"."mocovi_tipo_programa" ( "id_tipo_programa" )
	ON DELETE CASCADE ON UPDATE CASCADE
	DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "public"."mocovi_programa"
	ADD CONSTRAINT "fk_programa_uni_acad" FOREIGN KEY ( "id_unidad" ) REFERENCES "public"."unidad_acad" ( "sigla" )
	ON DELETE CASCADE ON UPDATE CASCADE
	DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "public"."unidad_acad"
	ADD CONSTRAINT "fk_ua_tipo_dep" FOREIGN KEY ( "id_tipo_dependencia" ) REFERENCES "public"."mocovi_tipo_dependencia" ( "id_tipo_dependencia" )
	ON DELETE NO ACTION ON UPDATE NO ACTION
	DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "public"."mocovi_descentralizado_politica"
	ADD CONSTRAINT "id_unidad" FOREIGN KEY ( "id_unidad" ) REFERENCES "public"."unidad_acad" ( "sigla" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_politica"
	ADD CONSTRAINT "id_periodo" FOREIGN KEY ( "id_periodo" ) REFERENCES "public"."mocovi_periodo_presupuestario" ( "id_periodo" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_ingresos"
	ADD CONSTRAINT "idperiodo" FOREIGN KEY ( "id_periodo" ) REFERENCES "public"."mocovi_periodo_presupuestario" ( "id_periodo" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_ingresos"
	ADD CONSTRAINT "id_unidad" FOREIGN KEY ( "id_unidad" ) REFERENCES "public"."unidad_acad" ( "sigla" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_ingresos"
	ADD CONSTRAINT "id_tipo" FOREIGN KEY ( "id_tipo_ingreso" ) REFERENCES "public"."mocovi_descentralizado_tipo_ingresos" ( "id_tipo_ingresos" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_cargos"
	ADD CONSTRAINT "id_periodo" FOREIGN KEY ( "id_periodo" ) REFERENCES "public"."mocovi_periodo_presupuestario" ( "id_periodo" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_cargos"
	ADD CONSTRAINT "id_unidad" FOREIGN KEY ( "id_unidad" ) REFERENCES "public"."unidad_acad" ( "sigla" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_cargos"
	ADD CONSTRAINT "id_programa" FOREIGN KEY ( "id_programa" ) REFERENCES "public"."mocovi_programa" ( "id_programa" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_cargos"
	ADD CONSTRAINT "id_categoria" FOREIGN KEY ( "id_categoria" ) REFERENCES "public"."categ_siu" ( "codigo_siu" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_cargos"
	ADD CONSTRAINT "id_tipo_gasto" FOREIGN KEY ( "id_tipo_gasto" ) REFERENCES "public"."mocovi_descentralizado_tipo_gasto" ( "id_tipo_gasto" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_cargos"
	ADD CONSTRAINT "id_escalafon" FOREIGN KEY ( "id_escalafon" ) REFERENCES "public"."escalafon" ( "id_escalafon" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_tipo_permuta" FOREIGN KEY ( "id_tipo_permuta" ) REFERENCES "public"."mocovi_descentralizado_tipo_permuta" ( "id_tipo_permuta" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_tipo_gasto" FOREIGN KEY ( "id_tipo_gasto" ) REFERENCES "public"."mocovi_descentralizado_tipo_gasto" ( "id_tipo_gasto" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_periodo" FOREIGN KEY ( "id_periodo" ) REFERENCES "public"."mocovi_periodo_presupuestario" ( "id_periodo" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_escalafon" FOREIGN KEY ( "id_escalafon" ) REFERENCES "public"."escalafon" ( "id_escalafon" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_categoria" FOREIGN KEY ( "id_categoria" ) REFERENCES "public"."categ_siu" ( "codigo_siu" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_unidad" FOREIGN KEY ( "id_unidad" ) REFERENCES "public"."unidad_acad" ( "sigla" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_programa" FOREIGN KEY ( "id_programa" ) REFERENCES "public"."mocovi_programa" ( "id_programa" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_unidad_permuta" FOREIGN KEY ( "id_unidad_permuta" ) REFERENCES "public"."unidad_acad" ( "sigla" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_permutas"
	ADD CONSTRAINT "id_programa_permuta" FOREIGN KEY ( "id_programa_permuta" ) REFERENCES "public"."mocovi_programa" ( "id_programa" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_presupuesto_general"
	ADD CONSTRAINT "id_periodo" FOREIGN KEY ( "id_periodo" ) REFERENCES "public"."mocovi_periodo_presupuestario" ( "id_periodo" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_presupuesto_general"
	ADD CONSTRAINT "id_unidad" FOREIGN KEY ( "id_unidad" ) REFERENCES "public"."unidad_acad" ( "sigla" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_presupuesto_general"
	ADD CONSTRAINT "id_objeto_del_gasto" FOREIGN KEY ( "id_objeto_del_gasto" ) REFERENCES "public"."mocovi_descentralizado_objeto_del_gasto" ( "id_objeto_del_gasto" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_presupuesto_general"
	ADD CONSTRAINT "id_tipo_gasto" FOREIGN KEY ( "id_tipo_gasto" ) REFERENCES "public"."mocovi_descentralizado_tipo_gasto" ( "id_tipo_gasto" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE "public"."mocovi_descentralizado_presupuesto_general"
	ADD CONSTRAINT "id_programa" FOREIGN KEY ( "id_programa" ) REFERENCES "public"."mocovi_programa" ( "id_programa" )
	ON DELETE RESTRICT ON UPDATE RESTRICT;

