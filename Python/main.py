import requests, pandas as pd

#################################################################################

def generar_peticion(url, mensaje = "empty"):
    '''
        Funcion creada para realizar peticion POST
    '''

    # Json para enviar a el post (por ahora unicamente mensaje)
    json_body = {
        "message": mensaje
    }
    
    # Solicitud post
    response = requests.post(url= url, json=json_body)
    
    # Se retorna lo recibido por el request
    return response
       

#################################################################################

URL = "https://frameee.app.n8n.cloud/webhook-test/33296104-1926-43eb-9539-c6f9e2c309a0" # URL de webhook en n8n

mensaje = input("Que desea consultar: ") # Mensaje para enviar a la IA
print('\n')

try:
    response = generar_peticion(URL, mensaje) # Respuesta recibida en formato request
    json_response = response.json() # Tranformacion de request a json
    
except requests.exceptions.JSONDecodeError: # Captura de error json, causado por que el mismo no cumple con la sintaxis
    print("Error en formato json recibido")
    
else:
    df = pd.json_normalize(json_response) # Creando dataframe en base al json 
    print(df) # Impresion de dataframe
    
    opcion = input("\nDesea crar un csv con los resultados? (Y/N): ").upper() # Consulta para guardar los resultados
    while(opcion != 'Y' and opcion != 'N'):
        print("ERROR - Ingrese opcion valida.")
        opcion = input("\nDesea crar un csv con los resultados? (Y/N): ").upper()

    if opcion == 'Y':
        df.to_csv("prueba.csv") # Creando el CSV
        print("CSV creado con exito")

finally:
    print("Adios!")

#################################################################################