CREATE TABLE IF NOT EXISTS Localidad(
  id_localidad SERIAL PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Grupo_sanguineo(
  id_grupo SERIAL PRIMARY KEY,
  grupo VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Obra_social(
  id_obra SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Impedimento_fisico(
  id_impedimento SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Medicamento(
  id_medicamento SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Alergia(
  id_alergia SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Paciente(
	id_paciente SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  dni INT NOT NULL,
	fecha_nacimiento DATE,
	num_afiliado INT,
	num_domicilio INT,
	calle_domicilio VARCHAR(255),
	depto_domicilio INT,
  id_localidad INT,
  id_grupo_sanguineo INT,
  id_obra_social INT,
  
  CONSTRAINT FK_localidad FOREIGN KEY (id_localidad) REFERENCES Localidad(id_localidad),
  CONSTRAINT FK_grupo_sanguineo FOREIGN KEY (id_grupo_sanguineo) REFERENCES Grupo_sanguineo(id_grupo),
  CONSTRAINT FK_obra_social FOREIGN KEY (id_obra_social) REFERENCES Obra_social(id_obra)
);

CREATE TABLE IF NOT EXISTS Paciente_impedimento (
  id_paciente INT,
  id_impedimento INT,
  CONSTRAINT FK_paciente_pac_imp FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
  CONSTRAINT FK_impedimento FOREIGN KEY (id_impedimento) REFERENCES Impedimento_fisico(id_impedimento),
  CONSTRAINT PK_paciente_impedimento PRIMARY KEY (id_paciente,id_impedimento)
);

CREATE TABLE IF NOT EXISTS Paciente_medicamento (
  id_paciente INT,
  id_medicamento INT,
  CONSTRAINT FK_paciente_pac_med FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
  CONSTRAINT FK_medicamento FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento),
  CONSTRAINT PK_paciente_medicamento PRIMARY KEY (id_paciente,id_medicamento)
);

CREATE TABLE IF NOT EXISTS Paciente_alergia (
  id_paciente INT,
  id_alergia INT,
  CONSTRAINT FK_paciente_pac_alerg FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
  CONSTRAINT FK_alergia FOREIGN KEY (id_alergia) REFERENCES Alergia(id_alergia),
  CONSTRAINT PK_paciente_alergia PRIMARY KEY (id_paciente,id_alergia)
);

------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Profesional (
	legajo SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	matricula INT NOT NULL,
	email VARCHAR(255),
	telefono INT,
	fecha_contratacion DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Especialidad (
	id_especialidad SERIAL PRIMARY KEY,
	descripcion VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Profesional_especialidad (
	legajo_profesional INT,
	id_especialidad INT,
	CONSTRAINT FK_profesional_esp FOREIGN KEY (legajo_profesional) REFERENCES Profesional (legajo),
	CONSTRAINT FK_especialidad_pro FOREIGN KEY (id_especialidad) REFERENCES Especialidad (id_especialidad),
	CONSTRAINT PK_pro_esp PRIMARY KEY (legajo_profesional,id_especialidad)
);

------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Sector (
	id_sector SERIAL PRIMARY KEY,
	letra CHAR NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Consultorio (
	numero SERIAL PRIMARY KEY,
	id_sector INT,
	CONSTRAINT FK_sector_con FOREIGN KEY (id_sector) REFERENCES Sector (id_sector)
);

CREATE TABLE IF NOT EXISTS Equipamiento (
	id_equipamiento SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Consultorio_equipamiento (
	num_consultorio INT,
	id_equipamiento INT,
	CONSTRAINT FK_consultorio_con_equip FOREIGN KEY (num_consultorio) REFERENCES Consultorio (numero),
	CONSTRAINT FK_equipamiento_con_equip FOREIGN KEY (id_equipamiento) REFERENCES Equipamiento (id_equipamiento),
	CONSTRAINT PK_consultorio_equipamiento PRIMARY KEY (num_consultorio,id_equipamiento)
);

------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Estado_turno (
	id_estado SERIAL PRIMARY KEY,
	estado VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Turno (
	id_turno SERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	id_paciente INT NOT NULL,
	legajo_profesional INT NOT NULL,
	num_consultorio INT NOT NULL,
	id_estado INT NOT NULL,
	CONSTRAINT FK_paciente_tur FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente),
	CONSTRAINT FK_profesional_tur FOREIGN KEY (legajo_profesional) REFERENCES Profesional (legajo),
	CONSTRAINT FK_consultorio_tur FOREIGN KEY (num_consultorio) REFERENCES Consultorio (numero),
	CONSTRAINT FK_estado_tur FOREIGN KEY (id_estado) REFERENCES Estado_turno (id_estado)
);

CREATE TABLE IF NOT EXISTS Diagnostico (
	id_diagnostico SERIAL PRIMARY KEY,
	id_turno INT NOT NULL,
	comentario TEXT,
	CONSTRAINT FK_turno_diag FOREIGN KEY (id_turno) REFERENCES Turno (id_turno)
);

------------------------------------------------------------------------------------------------------------
