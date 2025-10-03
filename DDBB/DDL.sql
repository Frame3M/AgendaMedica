CREATE TABLE IF NOT EXISTS Provincia(
	id_provincia SERIAL PRIMARY KEY,
  nombre VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS Localidad(
  id_localidad SERIAL PRIMARY KEY,
  id_provincia INT,
  nombre VARCHAR(150),
  CONSTRAINT FK_provincia FOREIGN KEY (id_provincia) REFERENCES Provincia (id_provincia)
);

CREATE TABLE IF NOT EXISTS Domicilio(
  id_domicilio SERIAL PRIMARY KEY,
  numero INT,
  calle VARCHAR(100) NOT NULL,
  id_localidad INT,
  CONSTRAINT FK_localidad FOREIGN KEY (id_localidad) REFERENCES Localidad(id_localidad)
);

CREATE TABLE IF NOT EXISTS Grupo_sanguineo(
  id_grupo SERIAL PRIMARY KEY,
  grupo VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Obra_social(
  id_obra SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Impedimento_fisico(
  id_impedimento SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Medicamento(
  id_medicamento SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Alergia(
  id_alergia SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Paciente(
  num_afiliado SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  dni INT NOT NULL,
  id_domicilio INT,
  id_grupo_sanguineo INT,
  id_obra_social INT,
  
  CONSTRAINT FK_domicilio FOREIGN KEY (id_domicilio) REFERENCES Domicilio(id_domicilio),
  CONSTRAINT FK_grupo_sanguineo FOREIGN KEY (id_grupo_sanguineo) REFERENCES Grupo_sanguineo(id_grupo),
  CONSTRAINT FK_obra_social FOREIGN KEY (id_obra_social) REFERENCES Obra_social(id_obra)
);

CREATE TABLE IF NOT EXISTS Paciente_impedimento (
  id_paciente INT,
  id_impedimento INT,
  CONSTRAINT FK_paciente FOREIGN KEY (id_paciente) REFERENCES Paciente(num_afiliado),
  CONSTRAINT FK_impedimento FOREIGN KEY (id_impedimento) REFERENCES Impedimento_fisico(id_impedimento),
  CONSTRAINT PK_paciente_impedimento PRIMARY KEY (id_paciente,id_impedimento)
);

CREATE TABLE IF NOT EXISTS Paciente_medicamento (
  id_paciente INT,
  id_medicamento INT,
  CONSTRAINT FK_paciente FOREIGN KEY (id_paciente) REFERENCES Paciente(num_afiliado),
  CONSTRAINT FK_medicamento FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento),
  CONSTRAINT PK_paciente_medicamento PRIMARY KEY (id_paciente,id_medicamento)
);

CREATE TABLE IF NOT EXISTS Paciente_alergia (
  id_paciente INT,
  id_alergia INT,
  CONSTRAINT FK_paciente FOREIGN KEY (id_paciente) REFERENCES Paciente(num_afiliado),
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
);

CREATE TABLE IF NOT EXISTS Especialidad (
	id_especialidad SERIAL PRIMARY KEY,
	descripcion VARCHAR(255) NOT NULL
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
	CONSTRAINT FK_Sector_con FOREIGN KEY (id_sector) REFERENCES Sector (id_sector)
);

CREATE TABLE IF NOT EXISTS Equipamiento (
	id_equipamiento SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL UNIQUE
);

------------------------------------------------------------------------------------------------------------
