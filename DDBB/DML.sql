INSERT INTO Localidad (nombre) VALUES
('Recoleta'),
('Palermo'),
('Belgrano'),
('Caballito'),
('Almagro'),
('Villa Urquiza'),
('San Telmo'),
('Merlo'),
('Puerto Madero'),
('Flores'),
('Once'),
('Retiro'),
('Quilmes'),
('Avellaneda'),
('Lanús'),
('Lomas de Zamora'),
('Banfield'),
('Temperley'),
('Adrogué'),
('Burzaco'),
('Florencio Varela'),
('Berazategui'),
('San Isidro'),
('San Fernando'),
('Tigre'),
('San Martín'),
('Morón'),
('Ituzaingó'),
('Castelar'),
('Ramos Mejía');

INSERT INTO Grupo_sanguineo (grupo) VALUES
('A+'),
('A-'),
('B+'),
('B-'),
('AB+'),
('AB-'),
('O+'),
('O-');

INSERT INTO Obra_social (nombre) VALUES
('PAMI'),
('OSDE'),
('Swiss Medical'),
('Galeno'),
('Sancor Salud'),
('Omint'),
('Medifé'),
('UPCN'),
('OSPRERA'),
('UOCRA'),
('OSECAC'),
('OSPAT'),
('Mutual Sancor'),
('Federada Salud'),
('IOMA'),
('Luis Pasteur'),
('Jerárquicos Salud'),
('Obra Social de Empleados de Comercio'),
('Obra Social del Personal de la Construcción'),
('Obra Social del Personal Rural y Estibadores');

INSERT INTO Impedimento_fisico (nombre) VALUES
('Parálisis'),
('Paraplejia'),
('Cuadraplejia / Tetraplejia'),
('Discapacidad visual (ceguera)'),
('Discapacidad auditiva (sordera)'),
('Amputación de extremidad'),
('Espina bífida'),
('Parálisis cerebral'),
('Lesión de la médula espinal'),
('Distrofia muscular'),
('Artritis reumatoide'),
('Osteoartritis'),
('Esclerosis múltiple'),
('Enfermedad de Parkinson'),
('Ataxia'),
('Distonía'),
('Trastorno del movimiento'),
('Malformación congénita de miembros'),
('Hiperlaxitud articular'),
('Trastorno neuromotor');

INSERT INTO Medicamento (nombre) VALUES
('Aspirina'),
('Paracetamol'),
('Ibuprofeno'),
('Metformina'),
('Enalapril'),
('Losartán'),
('Amlodipina'),
('Atorvastatina'),
('Rosuvastatina'),
('Omeprazol'),
('Amoxicilina'),
('Amoxicilina + Ácido Clavulánico'),
('Albuterol'),
('Clonazepam'),
('Levotiroxina'),
('Metamizol'),
('Budesonida'),
('Carbamazepina'),
('Dexametasona'),
('Espironolactona');

INSERT INTO Alergia (nombre) VALUES
('Rinitis alérgica'),
('Asma alérgica'),
('Alergia al polen'),
('Alergia a los ácaros del polvo'),
('Alergia a los hongos'),
('Alergia a epitelios de animales (gatos, perros)'),
('Alergia a picaduras de abeja'),
('Alergia a picaduras de avispa'),
('Alergia a la proteína de la leche de vaca'),
('Alergia al maní'),
('Alergia a los frutos secos'),
('Alergia al huevo'),
('Alergia al pescado'),
('Alergia a los mariscos'),
('Alergia a la soja'),
('Alergia al trigo / gluten'),
('Alergia a la penicilina'),
('Alergia a la aspirina (AINEs)'),
('Alergia a la sulfa'),
('Alergia al látex');

INSERT INTO Paciente (nombre, apellido, dni, fecha_nacimiento, num_afiliado, num_domicilio, calle_domicilio, depto_domicilio, id_localidad, id_grupo_sanguineo, id_obra_social) VALUES
('José Luis', 'Paniagua', 22801413, '1987-09-14', 257233, 425, 'Avenida Alvear', NULL, 28, 2, 15),
('Calisto', 'Mendez', 24061810, '2000-06-24', 45280, 175, 'Avenida Cabildo', NULL, 7, 2, 19),
('Clotilde', 'Bilbao', 41215572, '1959-12-08', 781543, 2317, 'Avenida Elcano', NULL, 6, 6, 17),
('Esmeralda', 'Tolosa', 23785933, '1978-02-25', 194816, 3664, 'Avenida Rivadavia', '6A', 2, 3, 16),
('Priscila', 'Escolano', 49927088, '2015-11-29', 737952, 4246, 'Avenida Álvarez Thomas', '4A', 26, 4, 1),
('Esther', 'Antúnez', 23092461, '1936-09-15', 39745, 4864, 'Avenida Independencia', NULL, 30, 3, 16),
('Silvio', 'Borja', 23081678, '1963-10-04', 68937, 4485, 'Avenida Acoyte', '10B', 8, 7, 2),
('Leocadia', 'Alcántara', 48394995, '1945-06-11', 274036, 1830, 'Avenida Las Heras', '10B', 12, 7, 4),
('Fortunato', 'Gutiérrez', 46926869, '2023-11-29', 660471, 4320, 'Avenida Belgrano', '4A', 22, 6, 4),
('Seve', 'Lasa', 26381567, '1975-01-11', 325342, 2581, 'Avenida Córdoba', '6B', 12, 3, 20),
('Néstor', 'Salcedo', 39404518, '2012-02-09', 763567, 3851, 'Avenida Díaz Vélez', NULL, 7, 3, 3),
('Crescencia', 'Pomares', 20718199, '1962-07-20', 275341, 2345, 'Avenida Estado de Israel', '10D', 19, 6, 14),
('Adela', 'Leon', 41911905, '1948-05-27', 523666, 1667, 'Avenida Medrano', '2A', 15, 5, 10),
('Renato', 'Vega', 39182745, '1990-09-12', 839205, 1224, 'Avenida Juan Bautista Alberdi', NULL, 4, 1, 5),
('Mirta', 'Rojas', 28817542, '1973-04-03', 178935, 345, 'Avenida La Plata', '3B', 1, 8, 2),
('Luciano', 'Herrera', 40729186, '1982-11-30', 654783, 2876, 'Avenida Ángel Gallardo', NULL, 18, 2, 11),
('Cintia', 'Paredes', 25347189, '2005-01-17', 98745, 1543, 'Avenida Rivadavia', '7C', 13, 4, 8),
('Ezequiel', 'Domínguez', 39628574, '1968-05-21', 364728, 498, 'Avenida La Plata', NULL, 22, 1, 7),
('Patricia', 'Molina', 41829567, '1955-08-14', 923451, 3012, 'Avenida Independencia', '5A', 5, 3, 12),
('Gabriel', 'Silva', 24518739, '1998-06-09', 237845, 2156, 'Avenida Estado de Israel', NULL, 20, 5, 9),
('Verónica', 'Cabrera', 37291845, '1970-03-22', 184729, 732, 'Avenida Medrano', '2B', 10, 6, 13),
('Rodrigo', 'Suárez', 28639174, '1985-12-02', 657382, 1298, 'Avenida Rivadavia', NULL, 16, 1, 20),
('Mariana', 'Ortiz', 40291837, '2003-09-19', 492837, 412, 'Avenida La Plata', '1A', 3, 8, 6),
('Fernando', 'Campos', 35928147, '1995-07-27', 283746, 2945, 'Avenida Independencia', NULL, 16, 1, 20),
('Tobias', 'Fate', 44789510, '2002-02-26', 208430, 313, 'Avenida Calle Real', NULL, 8, 3, 13);

INSERT INTO Paciente_impedimento (id_paciente, id_impedimento) VALUES
(3, 5),
(5, 12),
(7, 1),
(9, 8),
(10, 15),
(12, 3),
(13, 7),
(15, 19),
(17, 11),
(18, 4),
(20, 6),
(22, 9),
(22, 2), -- este paciente tiene 2 impedimentos
(24, 14),
(25, 18);

INSERT INTO Paciente_alergia (id_paciente, id_alergia) VALUES
(2, 4),
(3, 12),
(5, 1),
(6, 7),
(8, 15),
(9, 2),
(20, 14),
(21, 9),
(23, 10),
(23, 18); -- este paciente tiene 2 alergias

INSERT INTO Paciente_medicamento (id_paciente, id_medicamento) VALUES
(2, 17),  -- paciente 2: alergia a ácaros -> budesonida (inhalada/resp)
(3, 2),   -- paciente 3: discapacidad auditiva -> paracetamol (analgésico seguro)
(5, 3),   -- paciente 5: osteoartritis -> ibuprofeno (AINE, analgesia/antiinflam.)
(6, 2),   -- paciente 6: picaduras de abeja (alergia) -> paracetamol (seguro)
(7, 14),  -- paciente 7: parálisis -> clonazepam (control de espasticidad/convulsiones)
(9, 13),  -- paciente 9: parálisis cerebral + asma -> albuterol (bronchodilatador)
(9, 14),  -- paciente 9: parálisis cerebral -> clonazepam (coadyuvante, 2º medicamento)
(12, 18), -- paciente 12: cuadraplejia -> carbamazepina (dolor neuropático / ... )
(13, 16), -- paciente 13: espina bífida -> metamizol (analgésico)
(17, 19), -- paciente 17: artritis reumatoide -> dexametasona (corto plazo en brote)
(20, 18), -- paciente 20: amputación -> carbamazepina (dolor neuropático)
(22, 18), -- paciente 22: lesión medular / paraplejia -> carbamazepina
(22, 14), -- paciente 22: + clonazepam (caso con 2 medicamentos, poco frecuente)
(23, 2),  -- paciente 23: alergia a maní y a aspirina -> paracetamol (evita AINEs)
(24, 14), -- paciente 24: Parkinson -> clonazepam (coadyuvante)
(25, 16); -- paciente 25: malformación congénita de miembros -> metamizol (analgésico)

--------------------------------------------------------------------------------------------------------------

INSERT INTO Especialidad (descripcion) VALUES
('Medicina General'),
('Pediatría'),
('Ginecología y Obstetricia'),
('Cardiología'),
('Dermatología'),
('Neurología'),
('Psiquiatría'),
('Endocrinología'),
('Oftalmología'),
('Otorrinolaringología'),
('Traumatología y Ortopedia'),
('Oncología'),
('Neumonología'),
('Gastroenterología'),
('Nefrología'),
('Reumatología'),
('Infectología'),
('Urología'),
('Cirugía General'),
('Medicina del Trabajo');

INSERT INTO Profesional (nombre, apellido, matricula, email, telefono, fecha_contratacion) VALUES
('Martín', 'González', 12345, 'mgonzalez@example.com', 1123456789, '2015-03-12'),
('Lucía', 'Fernández', 23456, 'lfernandez@example.com', 1145678901, '2018-07-25'),
('Santiago', 'Rodríguez', 34567, 'srodriguez@example.com', 1156789012, '2012-11-03'),
('Valentina', 'López', 45678, 'vlopez@example.com', 1134567890, '2019-01-14'),
('Matías', 'Pérez', 56789, 'mperez@example.com', 1167890123, '2014-05-22'),
('Camila', 'Martínez', 67890, 'cmartinez@example.com', 1178901234, '2016-09-30'),
('Federico', 'Gómez', 78901, 'fgomez@example.com', 1189012345, '2017-04-18'),
('Mariana', 'Sánchez', 89012, 'msanchez@example.com', 1135678901, '2013-08-10'),
('Ignacio', 'Romero', 90123, 'iromero@example.com', 1154321678, '2020-02-05'),
('Paula', 'Torres', 1234, 'ptorres@example.com', 1143219876, '2011-12-17'),
('Julián', 'Ruiz', 11223, 'jruiz@example.com', 1167894321, '2016-06-29'),
('Florencia', 'Ramírez', 22334, 'framirez@example.com', 1132456789, '2018-10-09'),
('Diego', 'Alvarez', 33445, 'dalvarez@example.com', 1156789342, '2013-03-27'),
('Sofía', 'Castro', 44556, 'scastro@example.com', 1178934561, '2019-07-19'),
('Nicolás', 'Ortiz', 55667, 'nortiz@example.com', 1143567892, '2012-01-23'),
('Gabriela', 'Molina', 66778, 'gmolina@example.com', 1132987654, '2015-09-11'),
('Bruno', 'Vega', 77889, 'bvega@example.com', 1156783214, '2017-05-04'),
('Andrea', 'Cabrera', 88990, 'acabrera@example.com', 1123456780, '2014-11-16'),
('Maximiliano', 'Silva', 99001, 'msilva@example.com', 1145672345, '2016-02-28'),
('Carolina', 'Hernández', 10112, 'chernandez@example.com', 1156789345, '2020-08-13'),
('Juan', 'Navarro', 12123, 'jnavarro@example.com', 1139234567, '2013-05-20'),
('Agustina', 'Rojas', 13134, 'arojas@example.com', 1123459012, '2011-09-08'),
('Martín', 'Crespo', 14145, 'mcrespo@example.com', 1145678901, '2018-04-01'),
('Laura', 'Figueroa', 15156, 'lfigueroa@example.com', 1134987654, '2012-12-12'),
('Diego', 'Vargas', 16167, 'dvargas@example.com', 1178654321, '2019-03-15');

INSERT INTO Profesional_especialidad (legajo_profesional, id_especialidad) VALUES
(1, 7),
(2, 3),
(3, 15),
(4, 10),
(5, 1),
(6, 12),
(7, 6),
(8, 18),
(9, 4),
(10, 20),
(11, 2),
(12, 14),
(13, 9),
(14, 16),
(15, 11),
(16, 5),
(17, 13),
(18, 8),
(19, 19),
(20, 17),
(21, 1),
(22, 6),
(23, 12),
(24, 3),
(25, 7),
-- Profesionales con 2 especialidades (poco común)
(3, 8),
(7, 14),
(12, 5),
(18, 2),
(20, 11);

--------------------------------------------------------------------------------------------------------------

INSERT INTO Sector (letra) VALUES
('A'),
('B'),
('C');

INSERT INTO Consultorio (id_sector) VALUES
(2),
(1),
(3),
(3),
(1),
(2),
(1),
(3),
(2),
(1),
(3),
(2),
(2),
(3),
(1),
(3),
(1),
(2),
(3),
(1),
(2),
(3),
(2),
(1),
(3);

INSERT INTO Equipamiento (nombre) VALUES
('Camilla'),
('Esfigmomanómetro'),
('Estetoscopio'),
('Termómetro'),
('Oxímetro de pulso'),
('Electrocardiógrafo (ECG)'),
('Monitor de signos vitales'),
('Ventilador mecánico'),
('Bisturí'),
('Aspirador quirúrgico'),
('Lámpara de exploración'),
('Silla de ruedas'),
('Cama hospitalaria'),
('Túnel de rayos X'),
('Ecógrafo'),
('Defibrilador'),
('Nebulizador'),
('Incubadora neonatal'),
('Equipo de anestesia'),
('Autoclave'),
('Torniquete'),
('Férula ortopédica'),
('Guantes estériles'),
('Máscaras de oxígeno'),
('Catéter venoso periférico'),
('Jeringa y agujas'),
('Balanza médica'),
('Centrífuga'),
('Microscopio clínico'),
('Equipo de fisioterapia');

INSERT INTO Consultorio_equipamiento (num_consultorio, id_equipamiento) VALUES
(3, 1),  -- Camilla
(3, 2),  -- Esfigmomanómetro
(3, 3),  -- Estetoscopio
(7, 1),  -- Camilla
(7, 4),  -- Termómetro
(7, 5),  -- Oxímetro de pulso
(12, 6), -- Electrocardiógrafo (ECG)
(12, 7), -- Monitor de signos vitales
(12, 3), -- Estetoscopio
(1, 2),  -- Esfigmomanómetro
(1, 4),  -- Termómetro
(25, 8), -- Ventilador mecánico
(25, 9), -- Bisturí
(18, 10),-- Aspirador quirúrgico
(18, 7), -- Monitor de signos vitales
(9, 11), -- Lámpara de exploración
(9, 12), -- Silla de ruedas
(15, 8), -- Ventilador mecánico
(15, 16),-- Metamizol
(21, 1), -- Camilla
(21, 5), -- Oxímetro de pulso
(2, 3),  -- Estetoscopio
(2, 2),  -- Esfigmomanómetro
(5, 4),  -- Termómetro
(5, 11), -- Lámpara de exploración
(8, 12), -- Silla de ruedas
(8, 1),  -- Camilla
(20, 13),-- Cama hospitalaria
(20, 14),-- Túnel de rayos X
(4, 15), -- Ecógrafo
(4, 6),  -- Electrocardiógrafo (ECG)
(6, 15), -- Ecógrafo
(6, 7),  -- Monitor de signos vitales
(10, 16),-- Defibrilador
(10, 17),-- Nebulizador
(17, 17),-- Nebulizador
(17, 18),-- Incubadora neonatal
(14, 18),-- Incubadora neonatal
(14, 19),-- Equipo de anestesia
(11, 19),-- Equipo de anestesia
(11, 20),-- Autoclave
(13, 20),-- Autoclave
(13, 21),-- Torniquete
(19, 21),-- Torniquete
(19, 22),-- Férula ortopédica
(23, 22),-- Férula ortopédica
(23, 23),-- Guantes estériles
(24, 23),-- Guantes estériles
(24, 24),-- Máscaras de oxígeno
(16, 24),-- Máscaras de oxígeno
(16, 25),-- Catéter venoso periférico
(22, 25),-- Catéter venoso periférico
(22, 26),-- Jeringa y agujas
(1, 26), -- Jeringa y agujas
(3, 27), -- Balanza médica
(7, 28), -- Centrífuga
(12, 29),-- Microscopio clínico
(9, 30), -- Equipo de fisioterapia
(15, 30);-- Equipo de fisioterapia

--------------------------------------------------------------------------------------------------------------

INSERT INTO estado_turno (estado) VALUES
('Reservado'),
('Confirmado'),
('Atendido'),
('Cancelado');

-- Tabla Turno con asignaciones coherentes profesional/consultorio para cada paciente
INSERT INTO Turno (fecha, hora, id_paciente, legajo_profesional, num_consultorio, id_estado) VALUES
-- Paciente 1: José Luis, sin impedimentos/alergias relevantes -> profesional general, consultorio estándar
('2025-01-15', '09:30:00', 1, 5, 3, 2), 
-- Paciente 2: Calisto, alergia a ácaros -> profesional neumonología, consultorio con nebulizador/oxímetro
('2025-03-22', '11:00:00', 2, 18, 16, 1), 
-- Paciente 3: Clotilde, discapacidad auditiva -> profesional otorrinolaringología, consultorio con equipo de exploración
('2025-04-10', '14:15:00', 3, 10, 12, 3), 
-- Paciente 4: Esmeralda, sin impedimentos -> profesional medicina general, consultorio estándar
('2025-06-05', '08:45:00', 4, 1, 7, 2), 
-- Paciente 5: Priscila, osteoartritis -> profesional reumatología, consultorio con camilla y monitor signos vitales
('2025-02-17', '10:30:00', 5, 16, 15, 4), 
-- Paciente 6: Esther, alergia a picaduras de abeja -> profesional medicina general, consultorio con oxímetro y camilla
('2025-07-12', '13:00:00', 6, 1, 5, 1), 
-- Paciente 7: Silvio, parálisis -> profesional neurología, consultorio con ventilador mecánico y camilla
('2025-05-20', '15:30:00', 7, 7, 7, 2), 
-- Paciente 8: Leocadia, alergia a epitelios de animales -> profesional neumonología, consultorio con nebulizador
('2025-08-03', '09:00:00', 8, 18, 8, 3), 
-- Paciente 9: Fortunato, parálisis cerebral + asma -> profesional neumonología + neurología, consultorio con ventilador y camilla
('2025-09-18', '12:45:00', 9, 7, 9, 2), 
-- Paciente 10: Seve, ataxia -> profesional neurología, consultorio con camilla y monitor signos vitales
('2025-10-25', '10:15:00', 10, 7, 15, 1), 
-- Paciente 11: Néstor, sin impedimentos -> profesional medicina general, consultorio estándar
('2025-11-05', '11:30:00', 11, 1, 2, 3), 
-- Paciente 12: Crescencia, cuadraplejia -> profesional neurología, consultorio con camilla, monitor signos vitales
('2025-03-14', '16:00:00', 12, 7, 12, 4), 
-- Paciente 13: Adela, espina bífida -> profesional traumatología/ortopedia, consultorio con camilla y férula
('2025-06-22', '09:45:00', 13, 11, 13, 1), 
-- Paciente 14: Renato, sin impedimentos -> profesional medicina general, consultorio estándar
('2025-04-30', '14:30:00', 14, 1, 14, 2), 
-- Paciente 15: Mirta, artritis reumatoide -> profesional reumatología, consultorio con camilla y monitor signos vitales
('2025-05-10', '08:30:00', 15, 16, 15, 3), 
-- Paciente 16: Luciano, sin impedimentos -> profesional medicina general, consultorio estándar
('2025-07-19', '15:00:00', 16, 1, 16, 4), 
-- Paciente 17: Cintia, artritis reumatoide -> profesional reumatología, consultorio con camilla y monitor signos vitales
('2025-08-27', '10:45:00', 17, 16, 17, 1), 
-- Paciente 18: Ezequiel, discapacidad visual -> profesional oftalmología, consultorio con lámpara de exploración
('2025-09-12', '11:15:00', 18, 9, 18, 2), 
-- Paciente 19: Patricia, sin impedimentos -> profesional medicina general, consultorio estándar
('2025-10-08', '13:30:00', 19, 1, 19, 3), 
-- Paciente 20: Gabriel, amputación -> profesional traumatología/ortopedia, consultorio con camilla, férula
('2025-11-20', '09:15:00', 20, 11, 20, 4), 
-- Paciente 21: Verónica, sin impedimentos -> profesional medicina general, consultorio estándar
('2025-12-01', '12:00:00', 21, 1, 21, 1), 
-- Paciente 22: Rodrigo, lesión medular/paraplejia -> profesional neurología, consultorio con camilla y monitor signos vitales
('2025-12-15', '10:30:00', 22, 7, 22, 2), 
-- Paciente 23: Mariana, alergia a maní + aspirina -> profesional neumonología, consultorio con nebulizador
('2025-12-22', '11:45:00', 23, 18, 23, 3), 
-- Paciente 24: Fernando, enfermedad de Parkinson -> profesional neurología, consultorio con camilla y monitor signos vitales
('2025-11-28', '14:15:00', 24, 7, 24, 2), 
-- Paciente 25: Tobias, malformación congénita de miembros -> profesional traumatología/ortopedia, consultorio con camilla y férula
('2025-12-30', '08:45:00', 25, 11, 25, 1);

-- Diagnósticos para turnos atendidos (id_estado = 3)
INSERT INTO Diagnostico (id_turno, comentario) VALUES
-- Turno 3: Clotilde, discapacidad auditiva
(3, 'Paciente con discapacidad auditiva. No se observa alteración adicional. Se sugiere control audiológico anual.'),
-- Turno 8: Leocadia, alergia a epitelios de animales
(8, 'Paciente presenta síntomas de rinitis alérgica leve. Se recomienda evitar exposición a mascotas y usar Budesonida inhalatoria según indicación.'),
-- Turno 11: Néstor, sin impedimentos/alergias
(11, 'Paciente en perfecto estado de salud. No se detectan anomalías.'),
-- Turno 15: Mirta, artritis reumatoide
(15, 'Paciente con antecedentes de artritis reumatoide. Observa rigidez articular leve en manos y rodillas. Se recomienda continuar tratamiento con Dexametasona en caso de brote.'),
-- Turno 18: Ezequiel, discapacidad visual
(18, 'Paciente con discapacidad visual. Presencia de leve hipertensión ocular. Se recomienda control oftalmológico regular.'),
-- Turno 23: Mariana, alergia a maní y aspirina
(23, 'Paciente con antecedentes de alergia a maní y AINEs. No se observaron signos de reacción alérgica durante la visita. Se sugiere continuar evitando AINEs y monitorear reacciones.'),
-- Turno 24: Fernando, enfermedad de Parkinson
(24, 'Paciente con enfermedad de Parkinson, presenta temblor leve y rigidez. Se ajusta medicación según evolución. Se recomienda seguimiento neurológico regular.');

--------------------------------------------------------------------------------------------------------------



