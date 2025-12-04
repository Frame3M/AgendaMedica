import requests, pandas as pd
from prettytable import PrettyTable
from colorama import Fore, Style, init

import os

URL_WEBHOOK = "http://localhost:5678/webhook/75d2ed5e-0c78-4a75-ac23-632c727f1c4b" # URL de webhook en n8n

init(autoreset=True) # Funcion para poder colorear el texto

#################################################################################

def generar_consulta(url, mensaje = "empty"):
    '''Envía la solicitud de datos al n8n y espera la respuesta.'''
    
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
        print(Fore.RED + f"❌ Error de conexión con N8N: \n\t{e}")
        return None

#################################################################################

def mostrar_resultados_tabla(json_data):
    '''Recibe datos en formato json y los muestra como una tabla'''
    
    tabla = PrettyTable()
    try:
        encabezados = list(json_data[0].keys())
        tabla.field_names = [h.upper() for h in encabezados]
        
    except AttributeError:
        print(Fore.RED + "❌ Error: El formato de datos recibido no es compatible.")
        return
    
    for registro in json_data:
        fila = [str(registro.get(key, 'N/A')) for key in encabezados]
        tabla.add_row(fila)
        
    tabla.align = "l"
    tabla.hrules = 1
    
    print("\n" + "=" * 100)
    print(Fore.GREEN + Style.BRIGHT + " " * 28 + "✅ Resultados de la Consulta CHECKINMED ✅\n")
    
    print(tabla)
    
    print("\n" + "=" * 100)
    
    # df = pd.json_normalize(json_data,record_path="output") # Creando dataframe en base al json
    # print("Aqui tiene su informacion 😊:\n")
    # print(df) # Impresion de dataframe
    # print("\n")
    
def guardar_csv(json_data):
    '''Recibe datos en formato json y los guarda en un csv'''
    
    df = pd.json_normalize(json_data,record_path="output") # Creando dataframe en base al json 
    df.to_csv("prueba.csv") # Creando el CSV
    
    print(Fore.GREEN + Style.BRIGHT + "\n" + " " * 36 + "✅ CSV creado con exito ✅")
    
#################################################################################

def limpiar_terminal():
    '''Realizar un clear screen de la terminal'''
    
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')

#################################################################################

def pause():
    '''Realiza una pausa en el programa hasta que el usuario presiones enter'''
    
    input(Fore.LIGHTMAGENTA_EX + Style.BRIGHT + "\nPresiona " + Fore.WHITE + "enter" + Fore.LIGHTMAGENTA_EX + " para continuar...")

#################################################################################

is_running = True
while is_running:

    limpiar_terminal()
    
    print("\n" + "=" * 100)
    print(Fore.CYAN + Style.BRIGHT + " " * 35 + "🚑️ Terminal CHECKINMED v1.5 🚑️")
    print("=" * 100 + "\n")

    print(Style.BRIGHT + " " * 22 + "-- ¡Bienvenido a la teminal medica de CHECKINMED😊! --\n")
    print(Style.BRIGHT + " " * 19 + "🏥 Puedes solicitar todo tipo de informacion de el Hospital 🗄️\n")
    print(Style.BRIGHT + " " * 19 + "Incluso puedes pedir que se envie a GMAIL o se suba a DRIVE 📨\n")
    print(Style.BRIGHT + " " * 37 + "Para salir ingresa" + Fore.MAGENTA + " exit " + Fore.WHITE + "😊\n")

    mensaje = input("Que desea consultar: ").lower() # Mensaje para enviar a N8N

    if mensaje != "exit":
        
        print(Fore.LIGHTBLUE_EX + Style.BRIGHT + "\n" + " " * 27 + f"📡 Enviando solicitud de consulta a N8N... 📡\n")

        response = generar_consulta(URL_WEBHOOK, mensaje) # Respuesta recibida en formato REQUEST

        if response: # Si recibimos algo (no ocurrio ningun error) continuamos

            try:
                json_response = response.json() # Tranformacion de request a json (si podemos)
                
            except requests.exceptions.JSONDecodeError as e: # Captura de error json, causado por que el mismo no cumple con la sintaxis correcta
                print(Fore.RED + f"❌ Error en formato json recibido de N8N: \n\t{e}")
                
            else:
                if len(json_response.get("output",[])) > 0:
                    mostrar_resultados_tabla(json_response["output"])
                    
                    while True:
                        opcion = input("\nDesea crear un csv con los resultados? (Y/N): ").upper() # Consulta para guardar los resultados
                        
                        if opcion == 'Y':
                            guardar_csv(json_response)
                            break
                        
                        elif opcion == 'N':
                            print(Fore.YELLOW + Style.BRIGHT + "\n" + " " * 41 + "- CSV no creado -")
                            break
                        
                        else:
                            print(Fore.RED + "❌ Error - Ingrese opcion valida.")
                        
                else:
                    print(Fore.RED + " "*24 + "❌ No se obtuvieron resultados para su consulta ❌")
            
            print("\n" + "=" * 100 + "\n")
            pause() # Presiona enter para continuar

    else:
        print(Fore.GREEN + Style.BRIGHT + "\n" + " " * 46 + "¡Adios!\n")
        is_running = False
        print("=" * 100 + "\n")
    

#################################################################################