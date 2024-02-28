# Mobile APP

Una aplicación de salud hecha en Flutter.

![App Modules](./documentation/images/app_amacom_1.png)

![App Modules](./documentation/images/app_amacom_2.png)


## Primeros Pasos

Este proyecto es un punto de partida para una aplicación Flutter.

Algunos recursos para empezar si este es tu primer proyecto Flutter:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

Si necesitas ayuda para empezar a desarrollar en Flutter, consulta la
[documentación en línea](https://docs.flutter.dev/), que ofrece tutoriales, ejemplos, orientación sobre desarrollo móvil y una referencia completa de la API.

---

### 1. Información de versión

- Flutter Version: 3.10.2
- FVM Version: 2.4.1

Asegúrese de utilizar las versiones especificadas de Flutter y FVM para garantizar la compatibilidad con este proyecto.

Para configurar Flutter con la versión correcta, puede utilizar FVM (Flutter Version Management). Siga los pasos que se indican a continuación:

1. Instala FVM ejecutando el siguiente comando en tu terminal:

   ```bash
   $ dart pub global activate fvm
   ```

2. 2. Inicializa FVM en tu proyecto ejecutando el siguiente comando en el directorio raíz de tu proyecto:

   ```bash
   $ fvm init
   ```

3. 3. Establece la versión de Flutter para este proyecto:

   ```bash
   $ fvm use 3.10.2
   ```

Ahora ya tienes Flutter configurado con la versión correcta para este proyecto usando FVM. Puedes continuar con el desarrollo de Flutter para esta aplicación.

Para más información sobre FVM y su uso, consulta la [documentación de FVM](https://fvm.app/).

### 2. Ejecuta la Aplicación en modo Development, Release or Profile
Para que la aplicación funcione sin problemas debes especificar la url HOST para enviar las peticiones HTTP. Para ello, debes definir en entorno de compilación de la aplicación. Si estás usando VSCode, añade o modifica el archivo ``.vscode/launch.json`` y para los modos de lanzamiento deseados añade las siguientes líneas con tu url HOST.

   ```
   {
      "name": "amacom_app",
      "request": "launch",
      "type": "dart",
      "flutterMode": "{{modo deseado}}",
      "toolArgs": [
            "--dart-define",
            "HOST={{su url de host aquí}}",
      ],
      "args": [
            "--dart-define=HOST={su url de host aquí}}",
      ],
      "env": {
            "HOST": "",
      }
   }
   ```
Con esto ya puedes lanzar la aplicación sin problemas en tu dispositivo o emulador ejecutando el siguiente comando en el directorio raíz de la app:
   ```bash
   $ flutter run
   ```
O simplemente lanzándola directamente desde VSCode

![App Modules](./documentation/images/launch_app.png)

### 3. Compilar la aplicación para su distribución

Antes de cualquier operación debemos definir la url del HOST en la compilación de la aplicación. Si compila directamente desde el terminal, sólo tiene que añadir ``--dart-define=HOST={{su url de host}}`` en su comando de compilación.

Como ejemplo, aquí es cómo debe ser similar para android apk construir:

   ```bash
   $ flutter build apk --release --dart-define=HOST={{su url de host}}
   ```

Para compilar la aplicación para su despliegue en plataformas soportadas por flutter debes seguir la guía oficial de flutter [online documentation for deployment](https://docs.flutter.dev/deployment).

