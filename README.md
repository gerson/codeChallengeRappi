# codeChallengeRappi

1.	Las capas de la aplicación (por ejemplo capa de persistencia, vistas, red, negocio, etc) y qué clases pertenecen a cual.
    
   --------------------------------------------------------------------------------------------
   Manejo de servicios (Requests a la API) a traves de Alamofire y Capa de persistencia (Realm)
   --------------------------------------------------------------------------------------------
   
   - Networking
   - Repository
   
   ------------------------------------------------------------------------------------
   Puedes encontrar estas capas en cada una de las escenas creadas (Clean architecture)
   ------------------------------------------------------------------------------------
   
   - Views:
      Se encarga de dibujar (mostrar) lo que llegue proveniente del presenter, esta capa no deberia tener logica de
      negocio, asi que deberia ser los mas pasiva y simple posible. Tambien es la capa que interactua con los inputs
      externos (acciones de un usuario).
   - Interactors:
      Tiene la lógica del negocio, esta capa puede manejar entidades (modelos), para cualquier tarea requerida,
      esta capa es independiente de la interface grafica y debe modelar la informacion recibida que venga de una
      fuente de datos (en nuestro caso el worker).
   - Presenters:
      Esta capa contiene la lógica que la vista tiene que presentar y reacciona a los inputs que llegen desde la vista.
      Esto quiere decir que le dirá a la UI que tiene que pintar al recibir la información del Interactor y 
      reaccionará a las acciones de la vista para hacer una navegación o pedir data.
   - Routing:
      Esta capa está concentrada en la navegación de la app.
   - Workers:
      Esta capa es la que interactua con los servicios (online/offline) y son los que reciben las solicitudes provenientes
      del interactor.
   - Entity/Models:
      Contiene el modelo de los objetos usados por el Interactor

2.	La responsabilidad de cada clase creada.

-----------------------------------------------------------------------------------------------------------------------

1.	En qué consiste el principio de responsabilidad única? Cuál es su propósito?
  El principio de responsabilidad única es el primero de los 5 principios que conforman la definicion de SOLID (Single responsibility, Open-closed, Liskov substitution, Interface segregation and Dependency inversion). El proposito de este principio es definir la responsabilidad de un objeto, osea que un objeto debe realizar una única cosa.
  
2.	Qué características tiene, según su opinión, un “buen” código o código limpio
  - Una arquitectura definida
  - Unit test
  - Revisiones de deudas tecnicas
  - Analizadores de codigo
  - Un plus seria tener convenciones (style guide)
  
