# CheckinMed :ambulance:

![n8n Badge](https://img.shields.io/badge/Workflow-n8n-EA4B71?logo=n8n&logoColor=fff&style=for-the-badge)
![PostgreSQL Badge](https://img.shields.io/badge/SQL-PostgreSQL-4169E1?logo=postgresql&logoColor=fff&style=for-the-badge)
![Python Badge](https://img.shields.io/badge/Code-Python-3776AB?logo=python&logoColor=fff&style=for-the-badge)
![Beta](https://img.shields.io/badge/status-beta-yellow?style=for-the-badge)

Proyecto Final realizado para el **Centro Pescar ARTECH 2025**.

Este proyecto consiste en un sistema de automatizacion de consultas hospitalarias. El objetivo del sistema es permitir al usuario realizar consultas en un lenguaje natural a una base de datos con informacion hospitalaria.

## Descripcion de la problematica ✏️
Un hospital requiere un sistema inteligente que permita a los médicos consultar la ficha médica de los pacientes y los próximos turnos. 
El sistema debe ser capaz de entender consultas en un lenguaje natural y generar reportes con la informacion solicitada automaticamente.

## Arquitectura del proyecto 📐
![proyecto](https://github.com/user-attachments/assets/422c7ae5-e135-42d0-ab42-1321fa161917)

#### Stack Tecnologico:
* Una terminal en Python para poder recibir la consulta en lenguaje natural.
* Un flujo de trabajo automatizado en N8N que hace uso de una IA
* Una base de datos alojada en Supabase que contiene la informacion hospitalaria

#### Flujo de trabajo:
1. **Usuario Final**: Escribe solcitud en lenguaje natural sobre la terminal (Ej: Quiero la informacion de los turnos ***cancelados***).
2. **Python**: Envia solicitud a **Weebhook** en **N8N** via HTTP REST.
3. **N8N**: Recibe solicitud y la interpreta haciendo uso de un AI Agent.
4. **AI Agent**: Realiza una query **SQL** en base a la interpretacion.
5. **N8N**: Ejecuta la query formulada por el AI Agent sobre la base de datos.
6. **Base de datos**: Devuelve la informacion solicitada a **N8N**.
7. **N8N**: Procesa la informacion y la envia a la terminal en **Python**
8. **Python**: Recibe la informacion y la estructura en una tabla para la visualizacion del usuario final.

#### Flujo de trabajo condicional:
* Si el usuario solicita que se envie la informacion a un correo electronico, despues del paso 6 y antes del paso 7 se envia un reporte por mail.
* Si el usuario solicita que la informacion se suba a drive, despues del paso 6 y antes del paso 7 se genera un archivo csv en drive.

## Terminal :space_invader:
<img width="1264" height="549" alt="terminal4" src="https://github.com/user-attachments/assets/325845d9-176d-4fa8-b784-a908d060e38d" />

## Base de datos :bar_chart:
<img width="1950" height="1315" alt="DER-pgadmin-2" src="https://github.com/user-attachments/assets/9a89fef0-6a84-4b55-a716-37b60c41d940" />

## Flujo de trabajo automatizado N8N ⚙️
### Flujo principal - Agente Interprete
Encargado de dirigir todo el proceso de trabajo automatizado, desde la interpretacion de la solicitud inicial hasta el procesamiento de informacion para ser devuelta.

<img width="1124" height="308" alt="imagen" src="https://github.com/user-attachments/assets/65856443-e831-4f1f-bc55-8b5278d0e2d9" />

### Agente de busqueda
Encargado de conseguir la informacion solicitada de la base de datos, formacion de la query para la consulta.

<img width="986" height="488" alt="imagen" src="https://github.com/user-attachments/assets/a4e0ce28-c49d-4aa3-b392-39906d7d4170" />

### Flujo para mails
Encargado de la creacion de un archivo csv con la informacion para poder ser enviado por correo electronico.

<img width="935" height="217" alt="imagen" src="https://github.com/user-attachments/assets/3bd20710-aaac-4756-ba1e-618523116bba" />

### Flujo para Drive
Encargado de la creacion de un archivo csv con la informacion para poder ser subido a un drive.

<img width="937" height="212" alt="imagen" src="https://github.com/user-attachments/assets/6bef1106-499c-4a42-b253-6da9b72ba832" />


