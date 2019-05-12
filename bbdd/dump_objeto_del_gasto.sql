--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: mocovi_descentralizado_objeto_del_gasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (7, '1.4.0.0000', 'Asignaciones familiares', 5832, 5844, 'PP', 4, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (8, '1.5.0.0000', 'Asistencia social al personal', 5832, 5843, 'PP', 5, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (78, '1.9.0.0000', 'Personal Docente', 5832, 1000303, 'PP', 9, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (19, '2.7.0.0000', 'Productos metálicos', 5833, 5850, 'PP', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (4, '1.1.0.0000', 'Docente', 5832, 5847, 'PP', 1, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (5, '1.2.0.0000', 'No Docente', 5832, 5846, 'PP', 2, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (6, '1.3.0.0000', 'Autoridades', 5832, 5845, 'PP', 3, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (3, '1.0.0.0000', 'Gastos en personal', NULL, 5832, 'IN', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (12, '2.0.0.0000', 'Bienes de consumo', NULL, 5833, 'IN', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (22, '3.0.0.0000', 'Servicios no personales', NULL, 5834, 'IN', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (24, '3.2.0.0000', 'Alquileres y derechos', 5834, 5864, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (27, '3.5.0.0000', 'Servicios comerciales y financieros', 5834, 5861, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (28, '3.6.0.0000', 'Publicidad y propaganda', 5834, 5860, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (30, '3.8.0.0000', 'Impuestos, derechos, tasas y juicios', 5834, 5858, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (31, '3.9.0.0000', 'Otros servicios', 5834, 5857, 'PP', 9, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (32, '4.0.0.0000', 'Bienes de uso', NULL, 5835, 'IN', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (33, '4.1.0.0000', 'Bienes preexistentes', 5835, 5873, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (34, '4.2.0.0000', 'Construcciones', 5835, 5872, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (35, '4.3.0.0000', 'Maquinaria y equipo', 5835, 5871, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (36, '4.4.0.0000', 'Equipo militar y de seguridad', 5835, 5870, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (37, '4.5.0.0000', 'Libros, revistas y otros elementos coleccionables', 5835, 5869, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (38, '4.6.0.0000', 'Obras de arte', 5835, 5868, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (39, '4.7.0.0000', 'Semovientes', 5835, 5867, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (41, '5.0.0.0000', 'Transferencias', NULL, 5836, 'IN', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (51, '6.1.0.0000', 'Compra de acciones y participaciones de capital', 5837, 5890, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (55, '6.5.0.0000', 'Incremento de disponibilidades', 5837, 5886, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (56, '6.6.0.0000', 'Incremento de cuentas a cobrar', 5837, 5885, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (57, '6.7.0.0000', 'Incremento de documentos a cobrar', 5837, 5884, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (60, '7.1.0.0000', 'Servicio de la deuda en moneda nacional', 5838, 5899, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (61, '7.2.0.0000', 'Servicio de la deuda en moneda extranjera', 5838, 5898, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (71, '8.3.0.0000', 'Descuentos y bonificaciones', 5839, 5902, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (23, '3.1.0.0000', 'Servicios básicos', 5834, 5865, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (25, '3.3.0.0000', 'Mantenimiento, reparación y limpieza', 5834, 5863, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (26, '3.4.0.0000', 'Servicios técnicos y profesionales', 5834, 5862, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (29, '3.7.0.0000', 'Pasajes y viáticos', 5834, 5859, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (52, '6.2.0.0000', 'Préstamos a corto plazo', 5837, 5889, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (53, '6.3.0.0000', 'Préstamos a largo plazo', 5837, 5888, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (54, '6.4.0.0000', 'Adquisicion de títulos y valores', 5837, 5887, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (62, '7.3.0.0000', 'Intereses por préstamos recibidos', 5838, 5897, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (63, '7.4.0.0000', 'Disminución de préstamos a corto plazo', 5838, 5896, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (64, '7.5.0.0000', 'Disminución de préstamos a largo plazo', 5838, 5895, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (65, '7.6.0.0000', 'Disminución de cuentas y documentos a pagar', 5838, 5894, 'PP', 6, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (67, '7.8.0.0000', 'Disminución de otros pasivos', 5838, 5892, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (69, '8.1.0.0000', 'Intereses de instituciones públicas financieras', 5839, 5904, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (70, '8.2.0.0000', 'Depreciación y amortización', 5839, 5903, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (72, '8.4.0.0000', 'Otras pérdidas', 5839, 5901, 'PP', 4, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (73, '8.5.0.0000', 'Disminución del patrimonio', 5839, 5900, 'PP', 5, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (75, '9.1.0.0000', 'Gastos figurativos de la administración nacional para transacciones corrientes', 5840, 5907, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (76, '9.2.0.0000', 'Gastos figurativos de la administración nacional para transacciones de capital', 5840, 5906, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (77, '9.3.0.0000', 'Gastos figurativos de la administración nacional para aplicaciones financieras', 5840, 5905, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (58, '6.8.0.0000', 'Incremento de activos diferidos y adelantos a proveedores y contratistas', 5837, 5883, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (66, '7.7.0.0000', 'Disminución de depósitos en instituciones públicas financieras', 5838, 5893, 'PP', 7, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (9, '1.6.0.0000', 'Beneficios y compensaciones', 5832, 5842, 'PP', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (13, '2.1.0.0000', 'Bienes de Consumo', 5833, 5856, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (40, '4.8.0.0000', 'Activos intangibles (Software)', 5835, 5866, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (11, '1.8.0.0000', 'Personal Contratado', 5832, 1000302, 'PP', 8, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (79, '1.10.0.0000', 'Personal No Docente', 5832, 1000304, 'PP', 10, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (10, '1.7.0.0000', 'Gabinete de autoridades superiores', 5832, 5841, 'PP', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (43, '5.1.5.0000', 'Transferencias a instituciones de enseñanza', 5836, 5881, 'PP', 2, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (14, '2.2.0.0000', 'Textiles y vestuario', 5833, 5855, 'PP', 2, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (16, '2.4.0.0000', 'Productos de cuero y caucho', 5833, 5853, 'PP', 4, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (20, '2.8.0.0000', 'Minerales', 5833, 5849, 'PP', 8, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (21, '2.9.0.0000', 'Otros bienes de consumo', 5833, 5848, 'PP', 9, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (15, '2.3.0.0000', 'Productos de papel, cartón e impresos', 5833, 5854, 'PP', 3, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (17, '2.5.0.0000', 'Productos químicos, combustibles y lubricantes', 5833, 5852, 'PP', 5, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (18, '2.6.0.0000', 'Productos de minerales no metálicos', 5833, 5851, 'PP', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (42, '5.1.3.0000', 'Becas', 5836, 5882, 'PP', 1, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (44, '5.1.7.0000', 'Transferencias a otras instituciones culturales', 5836, 5880, 'PP', 3, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (49, '5.9.0.0000', 'Otras Transferencias', 5836, 5874, 'PP', 9, true);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (48, '5.8.0.0000', 'Transferencias a instituciones provinciales y municipales para financiar gastos de capital', 5836, 5875, 'PP', 8, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (47, '5.7.0.0000', 'Transferencias a instituciones provinciales y municipales para financiar gastos corrientes', 5836, 5876, 'PP', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (46, '5.6.0.0000', 'Transferencias a universidades nacionales', 5836, 5877, 'PP', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (45, '5.5.0.0000', 'Transferencias a otras entidades del sector público nacional', 5836, 5878, 'PP', 5, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (50, '6.0.0.0000', 'Activos financieros', NULL, 5837, 'IN', 6, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (59, '7.0.0.0000', 'Servicio de la deuda y disminución de otros pasivos', NULL, 5838, 'IN', 7, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (68, '8.0.0.0000', 'Otros gastos', NULL, 5839, 'IN', 8, false);
INSERT INTO mocovi_descentralizado_objeto_del_gasto VALUES (74, '9.0.0.0000', 'Gastos figurativos', NULL, 5840, 'IN', 9, false);


--
-- Name: mocovi_descentralizado_objeto_del_gasto_id_mocovi_descentralizado_objeto_del_gasto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mocovi_descentralizado_objeto_del_gasto_id_objeto_del_gasto_seq', 79, true);


--
-- PostgreSQL database dump complete
--

