CREATE OR REPLACE VIEW v_profesional_especialidades AS
  SELECT
    pe.legajo_profesional,
    STRING_AGG(e.descripcion, ', ') AS especialidades
  FROM
    profesional_especialidad pe
    INNER JOIN especialidad e ON e.id_especialidad = pe.id_especialidad
  GROUP BY
    pe.legajo_profesional
  ORDER BY
    pe.legajo_profesional;

--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_paciente AS
  SELECT
    p.id_paciente,
    p.nombre,
    p.apellido,
    p.dni,
    p.fecha_nacimiento,
    p.num_afiliado,
    p.num_domicilio,
    p.calle_domicilio,
    p.depto_domicilio,
    l.nombre AS localidad,
    gs.grupo AS grupo_sanguineo,
    os.nombre AS obra_social
  FROM
    paciente p
    INNER JOIN grupo_sanguineo gs ON gs.id_grupo = p.id_grupo_sanguineo
    INNER JOIN obra_social os ON os.id_obra = p.id_obra_social
    INNER JOIN localidad l ON l.id_localidad = p.id_localidad
  ORDER BY
    id_paciente;

--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_profesional AS
  SELECT
    p.legajo,
    p.nombre,
    p.apellido,
    p.matricula,
    p.email,
    p.telefono,
    p.fecha_contratacion,
    pe.especialidades
  FROM
    profesional p
    INNER JOIN v_profesional_especialidades pe ON pe.legajo_profesional = p.legajo
  ORDER BY
    legajo;

--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_turno AS
  SELECT
    t.id_turno,
    t.fecha,
    t.hora,
    pa.nombre AS nombre_paciente,
    pa.apellido AS apellido_paciente,
    pa.dni AS dni_paciente,
    pro.apellido AS profesional,
    pro.matricula AS matricula_profesional,
    pe.especialidades AS especialidades_profesional,
    t.num_consultorio,
    s.letra AS sector_consultorio,
    et.estado AS estado_turno
  FROM
    turno t
    INNER JOIN paciente pa ON pa.id_paciente = t.id_paciente
    --
    INNER JOIN profesional pro ON pro.legajo = t.legajo_profesional
    INNER JOIN v_profesional_especialidades pe ON pe.legajo_profesional = pro.legajo
    --
    INNER JOIN estado_turno et ON et.id_estado = t.id_estado
    --
    INNER JOIN consultorio c ON c.numero = t.num_consultorio
    INNER JOIN sector s ON s.id_sector = c.id_sector
  ORDER BY
    id_turno;

--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_paciente_alergia AS
  SELECT
    p.id_paciente,
    p.nombre,
    p.apellido,
    p.dni,
    p.fecha_nacimiento,
    p.num_afiliado,
    a.nombre AS alergia
  FROM
    paciente p
    INNER JOIN paciente_alergia pa ON pa.id_paciente = p.id_paciente
    INNER JOIN alergia a ON pa.id_alergia = pa.id_alergia
  ORDER BY
    p.id_paciente;

--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_paciente_impedimento AS
  SELECT
    p.id_paciente,
    p.nombre,
    p.apellido,
    p.dni,
    p.fecha_nacimiento,
    p.num_afiliado,
    if.nombre AS impedimento_fisico
  FROM
    paciente p
    INNER JOIN paciente_impedimento pi ON pi.id_paciente = p.id_paciente
    INNER JOIN impedimento_fisico if ON if.id_impedimento = pi.id_impedimento
  ORDER BY
    p.id_paciente;

--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_paciente_medicamento AS
  SELECT
    p.id_paciente,
    p.nombre,
    p.apellido,
    p.dni,
    p.fecha_nacimiento,
    p.num_afiliado,
    m.nombre AS medicamento_recetado
  FROM
    paciente p
    INNER JOIN paciente_medicamento pm ON pm.id_paciente = p.id_paciente
    INNER JOIN medicamento m ON m.id_medicamento = pm.id_medicamento
  ORDER BY
    p.id_paciente;

--------------------------------------------------------------------------------