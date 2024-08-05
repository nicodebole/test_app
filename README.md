## test_app

Implementado con Flutter 3.19.6.

Para seguir las buenas practicas de clean code y arquitectura hexagonal, se implementó la app con la siguiente estructura:

- config: Contiene archivos que configuran el proyecto
    - router: Configuración de rutas
    - config.dart: Almacenamiento de variables de entorno
- core: Contiene las entidades, repositorios y casos de uso.
    - entities: Definiciones de las entidades del dominio.
    - repositories: Definiciones de interfaces de repositorios.
    - usecases: Implementaciones de casos de uso.
- data: Implementación de la lógica de datos.
    - datasources: Fuentes de datos (API, almacenamiento local, etc.).
    - models: Modelos de datos que se usan en las capas de datos y dominio.
    - repositories: Implementaciones de los repositorios que interactúan con las fuentes de datos.
- dependency_injection:
- presentation: Todo lo relacionado a UI
    - bloc: Implementación de la gestión del estado usando Bloc.
    - pages: Visualización de paginas principales
    - widgets: Componentes de widgets reutilizables
- services: Contiene servicio de conectividad
    - connectivity_service: Clase que maneja el estado de conexión para offline access

## Paquetes utilizados
- flutter_bloc: Para la gestión del estado de la aplicación.
- go_router: Para la navegación y el enrutamiento.
- flutter_dotenv: Para manejar variables de entorno.
- http: Para realizar peticiones HTTP.
- hive: Para el almacenamiento local y el acceso sin conexión.
- connectivity_plus: Para la validación de conexión del teléfono.
- cached_network_image: Para manejar imagenes en caché.
- bloc_test: Para implementación de unit test.
- mocktail: Para facilitar los unit test.
- flutter_localizations: Para la implementación de soporte para múltiples idiomas

## Getting Started

Pasos para correr la app:
- Clonar el repositorio:
"git clone https://github.com/nicodebole/test_app.git"

- Instalar dependencias:
"flutter pub get"

- Crea un archivo .env en la raíz del proyecto con las siguientes variables:
PRODUCTS_BASE_URL=https://fakestoreapi.com

- Ejecutar la aplicacion