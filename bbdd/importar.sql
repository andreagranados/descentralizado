--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

INSERT INTO mocovi_tipo_dependencia VALUES (1, 'Centrales                                                   ');
INSERT INTO mocovi_tipo_dependencia VALUES (2, 'Dependencia                                                 ');
INSERT INTO mocovi_tipo_dependencia VALUES (3, 'Asentamiento                                                ');
INSERT INTO mocovi_tipo_dependencia VALUES (4, 'M�dulo                                                      ');


INSERT INTO unidad_acad VALUES ('FACE ', 'Facultad de Ciencias de la Educación                        ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FADE ', 'Facultad de Derecho y Ciencias Sociales                     ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FAEA ', 'Facultad de Economía y Administración                       ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FAIN ', 'Facultad de Ingeniería                                      ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FALE ', 'Facultad de Lenguas                                         ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FATU ', 'Facultad de Turismo                                         ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FAIF ', 'Facultad de Informática                                     ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FAAS ', 'Facultad de Ciencias del Ambiente y la Salud                ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FATA ', 'Facultad de Ciencia y Tecnología de los Alimentos           ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('FAME ', 'Facultad de Ciencias Médicas                                ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('RECT ', 'Rectorado                                                   ', 6, 'NCAP', 1);
INSERT INTO unidad_acad VALUES ('ASMA ', 'Asentamiento Universitario San Martín de los Andes          ', 6, 'RNG ', 3);
INSERT INTO unidad_acad VALUES ('AUZA ', 'Asentamiento Universitario Zapala                           ', 6, 'RNG ', 3);
INSERT INTO unidad_acad VALUES ('SESO ', 'Módulo de Derecho                                           ', 6, 'NCAP', 4);
INSERT INTO unidad_acad VALUES ('FAHU ', 'Facultad de Humanidades                                     ', 6, 'NCAP', 2);
INSERT INTO unidad_acad VALUES ('FACA ', 'Facultad de Ciencias Agrarias                               ', 6, 'NQN ', 2);
INSERT INTO unidad_acad VALUES ('ESCM ', 'Escuela de Ciencias Marinas                                 ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('CRUB ', 'Centro Regional Universitario Bariloche                     ', 6, 'RNG ', 2);
INSERT INTO unidad_acad VALUES ('CUZA ', 'Centro Regional Zona Atlántica                              ', 6, 'RNG ', 2);

INSERT INTO escalafon VALUES ('D', 'Docente        ');
INSERT INTO escalafon VALUES ('N', 'No Docente     ');
INSERT INTO escalafon VALUES ('S', 'Superior       ');


INSERT INTO categ_siu VALUES ('ADJ1', 'Profesor Adjunto Simple                      ', 'D');
INSERT INTO categ_siu VALUES ('ADJE', 'Profesor Adjunto Exclusivo                   ', 'D');
INSERT INTO categ_siu VALUES ('ADJS', 'Profesor Adjunto Semi-Exclusivo              ', 'D');
INSERT INTO categ_siu VALUES ('ASO1', 'Profesor Asociado Simple                     ', 'D');
INSERT INTO categ_siu VALUES ('ASOE', 'Profesor Asociado Exclusivo                  ', 'D');
INSERT INTO categ_siu VALUES ('ASOS', 'Profesor Asociado Semi-Exclusivo             ', 'D');
INSERT INTO categ_siu VALUES ('AY11', 'Ayudante de Primera Simple                   ', 'D');
INSERT INTO categ_siu VALUES ('AY1E', 'Ayudante de Primera Exclusivo                ', 'D');
INSERT INTO categ_siu VALUES ('AY1S', 'Ayudante de Primera Semi-Exclusiva           ', 'D');
INSERT INTO categ_siu VALUES ('AY21', 'Ayudante de Segunda Simple                   ', 'D');
INSERT INTO categ_siu VALUES ('JTP1', 'Jefe de Trabajos Prácticos Simple            ', 'D');
INSERT INTO categ_siu VALUES ('JTPE', 'Jefe de Trabajos Prácticos Exclusivo         ', 'D');
INSERT INTO categ_siu VALUES ('JTPS', 'Jefe de Trabajos Prácticos Semi-Exclusivo    ', 'D');
INSERT INTO categ_siu VALUES ('TIT1', 'Profesor Titular Simple                      ', 'D');
INSERT INTO categ_siu VALUES ('TITE', 'Profesor Titular Exclusivo                   ', 'D');
INSERT INTO categ_siu VALUES ('TITS', 'Profesor Titular Semi-Exclusivo              ', 'D');
INSERT INTO categ_siu VALUES ('VREE', 'Vice Rector                                  ', 'S');
INSERT INTO categ_siu VALUES ('SEFP', 'Secretario de Facultad Parcial               ', 'S');
INSERT INTO categ_siu VALUES ('RECT', 'Rector                                       ', 'S');
INSERT INTO categ_siu VALUES ('SEFC', 'Secretario de Facultad Tiempo Completo       ', 'S');
INSERT INTO categ_siu VALUES ('DECP', 'Decano de Facultad Parcial                   ', 'S');
INSERT INTO categ_siu VALUES ('SEFE', 'Secretario de Facultad Exclusivo             ', 'S');
INSERT INTO categ_siu VALUES ('SEUE', 'Secretario de Universidad Exclusivo          ', 'S');
INSERT INTO categ_siu VALUES ('VDEE', 'Vice Decano Facultad Exclusivo               ', 'S');
INSERT INTO categ_siu VALUES ('DECE', 'Decano de Facultad Exclusivo                 ', 'S');
INSERT INTO categ_siu VALUES ('SEFH', 'Secretario de Facultad Ad-Honorem            ', 'S');
INSERT INTO categ_siu VALUES ('01  ', 'Cat. 1 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('02  ', 'Cat. 2 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('03  ', 'Cat. 3 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('04  ', 'Cat. 4 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('05  ', 'Cat. 5 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('06  ', 'Cat. 6 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('07  ', 'Cat. 7 Decreto 366/06                        ', 'N');
INSERT INTO categ_siu VALUES ('CONT', 'Contrato en Pesos                            ', 'N');
INSERT INTO categ_siu VALUES ('CORP', 'Recursos Propios                             ', 'N');
INSERT INTO categ_siu VALUES ('SCRP', 'Rec.Propios S/Categoría                      ', 'N');
INSERT INTO categ_siu VALUES ('AY1H', 'Ayudante de primera AD H                     ', 'D');
INSERT INTO categ_siu VALUES ('AY2H', 'Ayudante de segunda AD H                     ', 'D');
INSERT INTO categ_siu VALUES ('JTPH', 'Jefe de Trabajos Prácticos AD H              ', 'D');
INSERT INTO categ_siu VALUES ('ADJH', 'Profesor Adjunto Ad-Honorem                  ', 'D');

INSERT INTO mocovi_tipo_programa VALUES (1, 'Educación de Grado');
INSERT INTO mocovi_tipo_programa VALUES (2, 'Lic. en Enfermeria Convenio Rio Negro');
INSERT INTO mocovi_tipo_programa VALUES (3, 'Lic. en Enfermeria Convenio Chubut');
INSERT INTO mocovi_tipo_programa VALUES (4, 'PROHUM');
INSERT INTO mocovi_tipo_programa VALUES (6, 'Prog. Unificación de Cargos');
INSERT INTO mocovi_tipo_programa VALUES (7, 'Convenio Carreras Ingeniería');
INSERT INTO mocovi_tipo_programa VALUES (8, 'Otros Convenios');
INSERT INTO mocovi_tipo_programa VALUES (5, 'Convenio Carrera de Topografía');
INSERT INTO mocovi_tipo_programa VALUES (9, 'Comunicación Oral y Escrita (COE)');
INSERT INTO mocovi_tipo_programa VALUES (10, 'Programa de Articulación Académica (PROAA)');


INSERT INTO mocovi_programa VALUES (47, 'FALE', 10, 'FRH en Tec. Adm. Sist. y Software Libre (FALE)', 29, 15, 19, 11, 'A.0001.029.015.019.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (48, 'FALE', 2, 'FRH en Enfermería (Sede: Viedma) - FALE', 29, 7, 19, 11, 'A.0001.029.007.019.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (49, 'FAME', 2, 'FRH en Enfermería (Sede: Viedma) - FAME', 29, 7, 27, 11, 'A.0001.029.007.027.11.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (50, 'FALE', 2, 'FRH en Enfermería (Sede: Bariloche) - FALE', 29, 6, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (20, 'FACA', 1, 'FRH en Cs. Agrarias', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (53, 'FAHU', 5, 'FRH en Topografía', 29, 13, 24, 11, NULL);
INSERT INTO mocovi_programa VALUES (11, 'FACE', 1, 'FRH en Cs. de la Educación', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (21, 'FADE', 1, 'FRH en Derecho y Cs. Sociales', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (8, 'FAEA', 1, 'FRH en Economia, Adm. y Matemática', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (1, 'FAIF', 1, 'FRH en Informática', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (9, 'FAHU', 1, 'FRH en Humanidades', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (23, 'FAIN', 1, 'FRH en Ingenierías, Geología y Prof.', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (3, 'FATU', 1, 'FRH en Turismo', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (17, 'CRUB', 1, 'FRH en Acuicultura, Biología y Educ. Física', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (18, 'CUZA', 1, 'FRH en Adm. Pública, Psicop. y Cs. Políticas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (28, 'ESCM', 1, 'FRH en Ciencias Marinas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (16, 'ASMA', 1, 'FRH en Tec. Forestal y Esp. Verdes', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (14, 'AUZA', 1, 'FRH en Minería, Planta y Analisis de Menas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (26, 'FATA', 1, 'FRH en Cs. y Tecnol. de los Alimentos', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (19, 'FAAS', 1, 'FRH en Cs. del Ambiente y la Salud', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (24, 'FALE', 1, 'FRH en Lenguas', 29, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (25, 'FAME', 1, 'FRH en Cs. Médicas', 27, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (2, 'FAIF', 8, 'FRH Tec. Desarrollo Web (Sede: Chos Malal)', 29, 11, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (30, 'FAAS', 2, 'FRH en Enfermería (Sede:Allen-Choele Choel)', 29, 3, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (31, 'CUZA', 2, 'FRH en Enfermería (Sede: Viedma)', 29, 7, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (32, 'CRUB', 2, 'FRH en Enfermería (Sede: Bariloche)', 29, 6, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (34, 'FAAS', 8, 'FRH en Tec. Sup. Higiene y Seg. Trabajo (Sede: Las Lajas)', 26, 7, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (54, 'FALE', 5, 'FRH en Topografía', 29, 13, 19, 11, NULL);
INSERT INTO mocovi_programa VALUES (52, 'FAEA', 5, 'FRH en Topografía', 29, 13, 23, 11, NULL);
INSERT INTO mocovi_programa VALUES (55, 'FAIF', 5, 'FRH en Topografía', 29, 13, 33, 11, NULL);
INSERT INTO mocovi_programa VALUES (41, 'CUZA', 9, 'FRH en Lengua y Com. Oral y Escrita', 29, 12, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (42, 'CUZA', 10, 'FRH en Tec. Adm. Sist. y Software Libre', 29, 15, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (44, 'FACA', 8, 'FRH en Tec. Espacios Verdes (Munic.Cinco Saltos)', 21, 2, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (12, 'FACE', 4, 'FRH en Cs Humanas (PROHUM)', 20, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (35, 'CRUB', 4, 'FRH en Cs Humanas (PROHUM)', 17, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (37, 'CUZA', 4, 'FRH en Cs Humanas (PROHUM)', 16, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (10, 'FAHU', 4, 'FRH en Cs Humanas (PROHUM)', 24, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (36, 'FALE', 4, 'FRH en Cs Humanas (PROHUM)', 19, 0, NULL, NULL, NULL);
INSERT INTO mocovi_programa VALUES (40, 'CRUB', 6, 'FRH en Acuicultura, Biología y Educ. Física', 29, 14, 17, 11, NULL);
INSERT INTO mocovi_programa VALUES (29, 'FAAS', 3, 'FRH en Enfermería (Sede:Chubut)', 29, 5, 0, 14, 'A.0001.029.005.000.14.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (33, 'FAAS', 2, 'FRH en Enfermería (Sede: Zapala)', 26, 8, 0, 14, 'A.0001.029.008.000.14.29.00.00.01.00.3.4');
INSERT INTO mocovi_programa VALUES (57, 'FAEA', 7, 'FRH en Ingenierías (Sede: Chos Malal)', 22, 99, 23, 14, NULL);
INSERT INTO mocovi_programa VALUES (39, 'FACE', 6, 'FRH en Cs. de la Educación', 29, 14, 20, 11, NULL);
INSERT INTO mocovi_programa VALUES (43, 'FAIN', 7, 'FRH en Ingenierías (Sede: Chos Malal)', 22, 99, 0, 14, NULL);
INSERT INTO mocovi_programa VALUES (38, 'AUZA', 5, 'FRH en Topografía', 29, 13, 0, 11, NULL);


--
-- Data for Name: mocovi_periodo_presupuestario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_periodo_presupuestario VALUES (1, 2015, '2015-02-01', '2016-01-31', NULL, false, NULL, NULL, NULL, NULL, false, false);
INSERT INTO mocovi_periodo_presupuestario VALUES (2, 2016, '2016-02-01', '2017-01-31', '2016-04-01', true, 468, 469, 473, 480, true, true);

-- Data for Name: mocovi_costo_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



INSERT INTO mocovi_costo_categoria VALUES (5, 1, 'ASOE', NULL, 653.269);
INSERT INTO mocovi_costo_categoria VALUES (2, 1, 'ADJE', NULL, 577.258);
INSERT INTO mocovi_costo_categoria VALUES (12, 1, 'JTPE', NULL, 501.247);
INSERT INTO mocovi_costo_categoria VALUES (8, 1, 'AY1E', NULL, 425.236);
INSERT INTO mocovi_costo_categoria VALUES (16, 1, 'TITS', NULL, 364.641);
INSERT INTO mocovi_costo_categoria VALUES (6, 1, 'ASOS', NULL, 326.635);
INSERT INTO mocovi_costo_categoria VALUES (3, 1, 'ADJS', NULL, 288.630);
INSERT INTO mocovi_costo_categoria VALUES (13, 1, 'JTPS', NULL, 250.624);
INSERT INTO mocovi_costo_categoria VALUES (9, 1, 'AY1S', NULL, 212.618);
INSERT INTO mocovi_costo_categoria VALUES (14, 1, 'TIT1', NULL, 182.318);
INSERT INTO mocovi_costo_categoria VALUES (4, 1, 'ASO1', NULL, 163.315);
INSERT INTO mocovi_costo_categoria VALUES (1, 1, 'ADJ1', NULL, 144.313);
INSERT INTO mocovi_costo_categoria VALUES (11, 1, 'JTP1', NULL, 125.311);
INSERT INTO mocovi_costo_categoria VALUES (7, 1, 'AY11', NULL, 106.308);
INSERT INTO mocovi_costo_categoria VALUES (10, 1, 'AY21', NULL, 85.046);
INSERT INTO mocovi_costo_categoria VALUES (15, 1, 'TITE', 14626, 729.29643835616);
INSERT INTO mocovi_costo_categoria VALUES (19, 2, 'TITE', 19123.71, 950.9604426229508197);
INSERT INTO mocovi_costo_categoria VALUES (20, 2, 'ASOE', 17114.33, 851.0404535519125683);
INSERT INTO mocovi_costo_categoria VALUES (21, 2, 'ADJE', 15104.96, 751.1209617486338798);
INSERT INTO mocovi_costo_categoria VALUES (22, 2, 'JTPE', 13095.58, 651.2009726775956284);
INSERT INTO mocovi_costo_categoria VALUES (23, 2, 'AY1E', 11086.21, 551.2814808743169399);
INSERT INTO mocovi_costo_categoria VALUES (24, 2, 'TITS', 9561.87, 475.4809672131147541);
INSERT INTO mocovi_costo_categoria VALUES (25, 2, 'ASOS', 8557.18, 425.5209726775956284);
INSERT INTO mocovi_costo_categoria VALUES (26, 2, 'ADJS', 7552.49, 375.5609781420765027);
INSERT INTO mocovi_costo_categoria VALUES (27, 2, 'JTPS', 6547.8, 325.6009836065573770);
INSERT INTO mocovi_costo_categoria VALUES (28, 2, 'AY1S', 5543.11, 275.6409890710382514);
INSERT INTO mocovi_costo_categoria VALUES (29, 2, 'TIT1', 4780.87, 237.7372513661202186);
INSERT INTO mocovi_costo_categoria VALUES (30, 2, 'ASO1', 4278.54, 212.7580000000000000);
INSERT INTO mocovi_costo_categoria VALUES (31, 2, 'ADJ1', 3776.2, 187.7782513661202186);
INSERT INTO mocovi_costo_categoria VALUES (32, 2, 'JTP1', 3273.86, 162.7985027322404372);
INSERT INTO mocovi_costo_categoria VALUES (33, 2, 'AY11', 2771.52, 137.8187540983606557);
INSERT INTO mocovi_costo_categoria VALUES (34, 2, 'AY21', 2217.22, 110.2552021857923497);


--
-- Name: mocovi_costo_categoria_id_costo_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_costo_categoria_id_costo_categoria_seq', 34, true);