import requests, pandas as pd
from colorama import Fore, Style, init

import os
import shutil
import time
import datetime

from rich.console import Console
from rich.table import Table
from rich.text import Text

URL_WEBHOOK = "http://localhost:5678/webhook/75d2ed5e-0c78-4a75-ac23-632c727f1c4b" # URL de webhook en n8n

init(autoreset=True) # Funcion para poder colorear el texto

#################################################################################

def generar_consulta(url, mensaje = "empty"):
    '''Envía la solicitud de datos al n8n y espera la respuesta.'''
    
    console = Console()
    
    # Json para enviar a el post (por ahora unicamente mensaje)
    json_body = {
        "message": mensaje
    }
    
    # Solicitud post
    try:
        response = requests.post(
            url= url,
            json=json_body)
        
        response.raise_for_status()
        
        # Se retorna lo recibido por el request
        return response
    
    # Error en la conexion
    except requests.exceptions.RequestException as e:
        console.print(Text(f"❌ Error de conexión con N8N: \n\t{e}", style="bold bright_red"))
        return None

#################################################################################

def mostrar_resultados_tabla_rich(json_data):
    '''Recibe datos en formato json y los muestra como una tabla'''
    
    console = Console()
    
    table = Table(
        show_lines=True,
        show_header=True
    )
    
    column_headers = list(json_data[0].keys())
    
    for header in column_headers:
        table.add_column(header.upper(), justify="center")
        
    for item in json_data:
        row_values = [str(item[header]) for header in column_headers]
        table.add_row(*row_values)
        
    console.print(table, justify="center")
    
def guardar_csv(json_data):
    '''Recibe datos en formato json y los guarda en un csv'''
    
    ahora = datetime.datetime.now()
    fecha_str = ahora.strftime("%Y-%m-%d")
    hora_str = ahora.strftime("%H-%M-%S")
    path_file = f"./save_data/data_{fecha_str}_{hora_str}.csv"
    
    df = pd.json_normalize(json_data,record_path="output") # Creando dataframe en base al json
    df.to_csv(path_file) # Creando el CSV
    
    console.print(Text("\n✅ CSV creado con exito ✅", style="bold green1 "), justify="center")
    console.print(Text(f"Guardado en {path_file}", style="bold green1 "), justify="center")
    
#################################################################################

def limpiar_terminal():
    '''Realizar un clear screen de la terminal'''
    
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')

def pause():
    '''Realiza una pausa en el programa hasta que el usuario presiones enter'''
    
    console = Console()
    console.input(Text("\nPresiona ", style="bold magenta") + Text("enter", style="bold white") + Text(" para continuar...", style="bold magenta"))

#################################################################################
        
def mostrar_decorado_completo(caracter="="):
    """Imprime una línea que ocupa todo el ancho de la terminal con el carácter especificado."""
    ancho = shutil.get_terminal_size().columns
    print(caracter * ancho)
        
#################################################################################

is_running = True
console = Console()

while is_running:

    limpiar_terminal()
    
    mostrar_decorado_completo("=")
    console.print(Text("🚑️ Terminal CHECKINMED v2.0 🚑️", style="bold cyan"), justify="center")
    mostrar_decorado_completo("=")
    
    console.print(Text("-- ¡Bienvenido a la teminal medica de CHECKINMED😊! --\n", style="bold"), justify="center")
    console.print(Text("🏥 Puedes solicitar todo tipo de informacion de el Hospital 🗄️\n", style="bold"), justify="center")
    console.print(Text("Incluso puedes pedir que se envie a GMAIL o se suba a DRIVE 📨\n", style="bold"), justify="center")
    console.print(Text("Para salir ingresa", style="bold") + Text(" exit ", style="bold magenta") + Text("😊\n"), justify="center")
    
    mensaje = input("Que desea consultar: " + Fore.LIGHTGREEN_EX + "").lower() # Mensaje para enviar a N8N
    
    if mensaje != "exit":
        
        console.print(Text("\n📡 Enviando solicitud de consulta a N8N... 📡\n", style="bold dodger_blue1"), justify="center")

        tiempo_inicio = time.perf_counter() # Estableciendo punto inicial de medicion de tiempo
        response = generar_consulta(URL_WEBHOOK, mensaje) # Respuesta recibida en formato REQUEST
        
        if response != None: # Si recibimos algo (no ocurrio ningun error) continuamos

            try:
                json_response = response.json() # Tranformacion de request a json (si podemos)
                
            except requests.exceptions.JSONDecodeError as e: # Captura de error json, causado por que el mismo no cumple con la sintaxis correcta
                console.print(Text(f"❌ Error en formato json recibido de N8N: \n\t{e}", style="bold bright_red"))
                
            else:
                if len(json_response.get("output",[])) > 0:
                    
                    tiempo_fin = time.perf_counter() # Estableciendo punto final de medicion de tiempo
                    tiempo_transcurrido = tiempo_fin - tiempo_inicio # Tiempo total en responder la consulta
                    
                    color_tiempo = "bold white"
                    
                    if tiempo_transcurrido <= 5:
                        color_tiempo = "bold green1"
                    elif tiempo_transcurrido <= 15:
                        color_tiempo = "bold yellow1"
                    else:
                        color_tiempo = "bold bright_red"
                    
                    
                    console.print(Text("Tiempo de consulta: ", style="bold dodger_blue1") + Text(f"{tiempo_transcurrido:.2f} sg.\n", style=color_tiempo), justify="center")
                    
                    mostrar_decorado_completo("=")
                    
                    console.print(Text("\n✅ Resultados de la Consulta CHECKINMED ✅\n", style="bold green1 "), justify="center")
                    mostrar_resultados_tabla_rich(json_response["output"])
                    
                    mostrar_decorado_completo("=")
                    
                    print("\n")
                    
                    while True:
                        opcion = input("Desea crear un csv con los resultados? (Y/N): ").upper() # Consulta para guardar los resultados
                        
                        if opcion == 'Y':
                            guardar_csv(json_response)
                            break
                        
                        elif opcion == 'N':
                            print("\n")
                            console.print(Text("- CSV no creado -", style="bold yellow1"), justify="center")
                            break
                        
                        else:
                            console.print(Text("❌ Error - Ingrese opcion valida.", style="bold bright_red"))
                        
                else:
                    console.print(Text("❌ No se obtuvieron resultados para su consulta ❌", style="bold bright_red"), justify="center")
            
            mostrar_decorado_completo("=")
            pause() # Presiona enter para continuar
            
        else:
            pause()

    else:
        
        console.print(Text("¡Adios!\n", style="bold green1"), justify="center")
        is_running = False
        mostrar_decorado_completo("=")
        print("\n")
    

#################################################################################