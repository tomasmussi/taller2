Objetivo
================================

Documentar información técnica del app server para poder compilar, ejecutar, debuggear, extender y mejorar el Application Server. 

Requisitos
===============================
El servidor de la aplicación Linkedun al cuál se consultan todos los servicios está desarrollado en C++, standard de 2011 (C++11) y utiliza las siguientes bibliotecas:

* Mongoose cpp[1] como web server para responder todas las consultas realizadas por la aplicación Android.
* Jsoncpp [2] biblioteca de JSON para C++.
* Curlpp [3] versión 0.7.3 o superior.
* GoogleTest [4] con tests unitarios que verifican que no se haya modificado funcionalidad existente. No es estrictamente necesario para continuar con el desarrollo de la aplicación, pero es ampliamente recomendado realizar tests y continuar con el desarrollo TDD [5].
* Leveldb [6] la base de datos clave-valor utilizada para guardar los datos de usuarios y la interacción entre los mismos.
* Log4Cpp [7] biblioteca de logging para C++.
* lcov & gcov [8] aplicaciones para verificar el code coverage que tienen los tests sobre la aplicación.
* CMake [9] para compilar el proyecto entero con todas las dependencias y también compilar y ejecutar los tests unitarios.

El código distribuido únicamente compila estáticamente la biblioteca de mongoose para asegurar que no existan problemas de compatibilidad al instalar, pero el resto de las bibliotecas se tienen que instalar y linkear dinámicamente con el ejecutable.
Se utiliza bibliotecas de terceros en todo el código, especialmente las bibliotecas de mongoose y jsoncpp. En el caso de la base de datos y la ejecución de peticiones http al otro servidor mediante curlpp se hizo una interfaz para lograr separar la utilización de la biblioteca y poder reemplazar dicha interfaz en caso de querer cambiar alguna biblioteca de terceros, es decir, usar alguna otra biblioteca de peticiones http e invocar directamente un comando del sistema operativo por ejemplo.

Distribución
=================================
El código puede ser descargado de la página oficial de github [10].
Sistema operativo
El desarrollo de la aplicación se ha realizado bajo el sistema operativo Linux. De querer desarrollar en Windows o Mac, deberá considerar la portabilidad de todas las dependencias a esos sistemas operativos y cómo realizar la compilación del proyecto.

Compilación
=============
Para compilar el app server, puede seguir cualquiera de los dos métodos:
1. Utilizar la imágen docker y ejecutar el comando docker run que iniciará una imagen con todas las dependencias instaladas y tendrá listo el servidor ejecutándose[a], como se detalla en el manual de instalación de servidores [11].
2. Instalar todas las dependencias mencionadas y realizar los siguientes pasos:
   1. Ir al directorio “server”
   2. Invocar el script: “. ./appear.sh” que se encarga de invocar a cmake con las opciones de compilación predeterminadas.

Ejecución
=============
Debería estar en el directorio de la carpeta build y de ahí puede ejecutar el binario y con esa invocación el servidor estará escuchando conexiones en el puerto 8080. Al binario del servidor se le pueden pasar dos parámetros opcionales, en el orden mencionado, para cambiar el puerto donde el servidor recibe las peticiones y la url del shared server. Ejemplos de ejecución:

* ./src/server
* ./src/server 7000
* ./src/server 8080 localhost:5642
* ./src/server 7000 https://guarded-sands-84788.herokuapp.com
* ./src/server 8080 https://guarded-sands-84788.herokuapp.com (esta es la invocación por defecto)

Si se define el puerto donde se escucharán conexiones, se debe especificar si o si la url del shared server. Cualquier otra invocación es incorrecta y derivará en errores en la aplicación.
Estructura
La estructura de la aplicación es un Controller de Mongoose que envía respuestas en formato JSON (para más detalles ver la API especificada), la clase que se encarga de todas las solicitudes es ApiJsonController y deriva las consultas en los handlers correspondientes. Un ejemplo con un diagrama de secuencia clarificará este párrafo.
 
.. image:: _static/getContacts.png

Los handlers, los cuáles son consultados por el ApiJsonController son:

* UserHandler: se encarga de la interacción entre los usuarios, las peticiones de contactar, votar, responder consultas y otros servicios.
* UserList: se encarga de mantener un listado actualizado de los usuarios, tanto darlos de alta en un registro, como consultar para ver qué usuarios están disponibles en el sistema.
* GoogleCloudMessagesHandler: se utiliza para enviar notificaciones cuando un usuario le envía un mensaje a otro.
* DatabaseHandler: se encarga de mantener realizar las operaciones de lectura y escritura en la base de datos. Simplemente tiene 3 métodos los cuales permiten realizar las operaciones necesarias.


Las entidades a destacar del sistema son:

* User: representa a los usuarios y es la clase fundamental dado que es una aplicación de interacción entre usuarios.
* Chat: representa un chat entre dos personas. El mismo tiene una lista de mensajes para mostrar que fueron enviando ambos y se puede reconstruir la conversación entera.
* Message: representa un mensaje enviado por un usuario. Se utiliza un timestamp guardado como string de forma de identificar el orden de los mensajes dentro del chat.
* HerokuService: deriva todas las consultas que deben ser realizadas al otro servidor y devuelve las respuestas a la aplicación de android tal cual son recibidas.
* Log: loguea toda la actividad del sistema en un archivo. Es una interfaz simple que utiliza Log4cpp para la finalidad de loguear.
Base de datos
Debido a un requisito no funcional, se utilizó una base de datos clave-valor.
Los usuarios, su información y las interacciones se persisten en la base de datos con una clave identificatoria según si es usuario o con un identificador especial para referirse a alguna entidad como la lista de usuarios. Las entidades de dominio están todas serializadas como JSON y se almacenan de esa manera en la base de datos.
ACLARACIÓN: cuando se encuentra algo entre los caracteres “<>” significa que se reemplaza la cadena dentro por el valor de la entidad. Por ejemplo, si tengo user-<user-id> una clave de un usuario en particular será user-johndoeid.

.. code-block:: json

	Entidad
		Clave
		Valor
		User
		user-<user-id>
		{
		      "user" : 
		      {
		              "city" : "CABA",
		              "dob" : "11/07/1991",
		              "email" : "tomas@gmail.com",
		              "fb_id" : "",
		              "friends" : [],
		              "job_positions" : [],
		              "latitude" : "",
		              "longitude" : "",
		              "name" : "Tomas Mussi",
		              "profile_photo" : "QdHVuZw==",
		              "requests" : [],
		              "skills" : [],
		              "summary" : "Estudiante UBA.",
		              "votes" : []
		      }
	}
		UserList
		users
		{  
		 "users":[  
		    "fb_id_tomas",
		    "fb_id_luis"
		 ]
	}


		Chat
		chat-<userid-1>-<userid2>
		{
	"messages" : 
		 [
		    {
		      "message" : "como va?",
		      "receiver_id" : "recv",
		      "sender_id" : "send",
		      "timestamp" : "2016-11-14 15:28:43"
		    },
		    {
		      "message" : "hola",
		      "receiver_id" : "recv",
		      "sender_id" : "send",
		      "timestamp" : "2016-11-14 13:57:23"
		    }
		 ]
	}

	

Respecto a un chat en especial, el <userid-1> será el del iniciador de la conversación, si uno quiere recuperar esa conversación y se desconoce quién inició la conversación, deberá probarse las dos combinaciones de ids para poder saber si existía una conversación previa entre los usuarios o hay que crear un chat nuevo. Esta resolución es engorrosa y en la próxima versión se contempla realizar un ordenamiento alfabético de los ids de usuario para no tener que probar las permutaciones de ids.
API
El app server respeta la API-REST[12] de interacción entre la aplicación Android y el servidor.


Contacto
===========

Por cualquier inquietud, duda, consulta, usted puede enviar un email a la casilla de correos linkedunservices@gmail.com y se le responderá a la brevedad.
También puede contribuir al proyecto, reportar bugs, etc en la página de github del proyecto.

Referencias
=============
* [1] Mongoose-cpp: `<https://github.com/Gregwar/mongoose-cpp>`_
* [2] Jsoncpp: `<https://github.com/open-source-parsers/jsoncpp>`_
* [3] Curlpp: `<http://www.curlpp.org/>`_
* [4] Google Test: `<https://github.com/google/googletest>`_
* [5] Test Driven Development: `<https://en.wikipedia.org/wiki/Test-driven_development>`_
* [6] Level DB: `<https://github.com/google/leveldb>`_
* [7] Log4Cpp: `<http://log4cpp.sourceforge.net/>`_
* [8] Gcov: `<https://gcc.gnu.org/onlinedocs/gcc/Gcov.html>`_
* [9] Cmake: `<https://cmake.org/>`_
* [10] Código del repositorio oficial de Linkedun: `<https://github.com/tomasmussi/taller2>`_
* [11] Manual de instalación de servidores: `<https://docs.google.com/document/d/1kZQ_5mHo0CJr2s9m6N1SgbrNDUm87tNNwNeo0STK0o/edit#heading=h.vo1cx285zg1d>`_
