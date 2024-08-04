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

## Getting Started

Pasos para correr la app:
- Clonar el repositorio:
"git clone https://github.com/nicodebole/test_app.git"

- Instalar dependencias:
"flutter pub get"

- Crea un archivo .env en la raíz del proyecto con las siguientes variables:
PRODUCTS_BASE_URL=https://fakestoreapi.com

- Ejecutar la aplicacion