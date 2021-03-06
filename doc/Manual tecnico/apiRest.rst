Objetivo
===============================

Definir el protocolo de comunicación entre la aplicación android y el app server que tenemos que implementar.
Funcionalidad: recordar que la funcionalidad pedida en el trabajo es:

* Loguearme en el sistema
* Ver/modificar mi perfil
* Buscar a otro usuario  (1) (lookup)
* Invitar a conectar a otro usuario (add_contact)
* Aceptar/cancelar una solicitud de conectar (accept_contact)
* Get my contacts…(get_contacts)
* Recomendar a un usuario (votar por un usuario)
* Consultar usuarios más populares
* Chatear con usuarios con los que haya conectado
* Ver/modificar Skills
* Ver/modificar job positions
* Cambiar mi ubicación actual


Servicio de autenticación
===============================

.. code-block:: json

	LoginDTO
	URL
		URL: http://<appserver>/api/fb_login
		HTTP VERB
		GET
		PARAMETROS
		{
		      “api_sec” : “api_sec_hash”,
		      “fb_user_id”: “a_fb_user_id”
	}
		RESPUESTA
		{  
		"data": 
		   {  
		      "token":"d975c4e93772b4fcbdf65ce62a1e14f6",
		      "user_exists":"false"
		   }
		,
		"errors":[  
		]
	}
		RESPUESTA
		{
		 “data”: null,
		 “errors”: [
		      “status” : “ERROR”,
		      “message” : “Facebook user ID invalido”
		 ]
	}
	

Servicio de búsqueda de profesionales
===============================

.. code-block:: json

	URL
		URL: http://<appserver>/api/lookup
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”,
		      “query” : “tomas”
	}
		RESPUESTA
		{  
		 "data":[  
		    [  
		       {  
		          "distance”:”3.978116”,
		          "fb_id":"tomas",
		          "is_contact":"false",
		          "name":"Tomas mussi",
		          "photo":"bas64encode..=="
		       }
		    ]
		 ],
		 "errors":[  


		 ]
	}


	

Servicio de actualización de ubicación
======================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/location
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      "latitude": “-34.595241”,
		      "longitude": “-58.402460”
	}
		RESPUESTA
		HTTP CODE 200
	{  
		 "data":
		    {  
		       "message":"Ubicacion de usuario actualizada",
		       "status":"OK"
		    }
		 ,
		 "errors":[  
		 ]
	}


	HTTP CODE 400
	{  
		 "data":[  
		 ],
		 "errors":[  
	{  
		       "message":"Latitud o longitud vacios",
		       "status":"ERROR"
		    }


		 ]
	}
	

Servicio de vista de mis contactos
===================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/get_contacts
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”
	}
		RESPUESTA
		{  
		 "data":[   
		       {  
		          "distance”:”3.978116”,
		          "fb_id":"tomas",
		          "is_contact":"true",
		          "name":"Tomas mussi",
		          "photo":"bas64encode..=="
		       }
		 ],
		 "errors":[  


		 ]
	}


Servicio de agregar contacto
=========================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/contact/
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      “contact_fb_id” : “a_user_fb_id”
	}
		RESPUESTA
		{  
		 "data":[  
		    {  
		       "message":"Enviada solicitud a contacto",
		       "status":"OK"
		    }
		 ],
		 "errors":[  
		 ]
	}


		RESPUESTA ERROR
		{
		 “data”:[],
		 “errors”: [
		      “status” : “ERROR”,
		      “message” : “El usuario no existe”
		 ]
	}
	

Servicio de vista respuesta de solicitudes de contactos
=======================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/contact/response
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      “contact_fb_id” : “a_user_fb_id”,
		      "accept": “true” / “false”
	}
		RESPUESTA
		{  
		 "data":[  
		    {  
		       "message":"Respondida solicitud a contacto",
		       "status":"OK"
		    }
		 ],
		 "errors":[  
		 ]
	}


		RESPUESTA ERROR
		{
		 “data”:[],
		 “errors”: [
		      “status” : “ERROR”,
		      “message” : “El usuario no existe”
		 ]
	}
	

Servicio de vista de solicitudes pendientes de contactos
============================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/contact/
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”
	}
		RESPUESTA
		{  
		 "data":[  
		    [  
		       {  
		          "fb_id":"tomas",
		          "is_contact":"false",
		          "name":"Tomas mussi",
		          "photo":"bas64encode..=="
		       },
		       {  
		          "fb_id":"luis",
		          "is_contact":"false",
		          "name":"Luis Arancibia",
		          "photo":"bas64encode..=="
		       }
		    ]
		 ],
		 "errors":[  


		 ]
	}


		RESPUESTA ERROR
		{
		 “data”:[],
		 “errors”: [
		      “status” : “ERROR”,
		      “message” : “El usuario no existe”
		 ]
	}


Servicio de recomendación
=========================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/vote
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      “contact_fb_id” : “a_user_fb_id”
	}
		RESPUESTA
		{  
		 "data":[  
		    {  
		       "message":"Enviada votación a contacto",
		       "status":"OK"
		    }
		 ],
		 "errors":[  


		 ]
	}


		RESPUESTA ERROR
		{  
		 "data":[
		 ],
		 "errors":[  
		       "message":"Usuario [a_user_fb_id] no existe o no es valido",
		       "status":"ERROR"
		 ]
	}


Servicio de consulta de usuarios más populares
================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/vote/popular
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”,
	}
		RESPUESTA
		{  
		 "data":[  
		    [  
		       {  
		          "fb_id":"tomas",
		          “is_contact” : “true”,
		          “name” : “Tomas Mussi”,
		          “photo” : “dsjagkjasg…==”,
		          "votes":1
		       },
		       {  
		          "fb_id":"aran.com.ar@gmail.com",
		          “is_contact” : “false”,
		          “name” : “Luis Arancibia”,
		          “photo” : “dsjagkjasg…==”,
		          "votes":0
		       },
		       {  
		          "fb_id":"a-fb-user-id",
		          “is_contact” : “false”,
		          “name” : “User Name”,
		          “photo” : “dsjagkjasg…==”,
		          "votes":0
		       }
		    ]
		 ],
		 "errors":[  
		 ]
	}


Servicio de conversaciones
===============================

.. code-block:: json

	URL
		URL: http://<appserver>/api/message/
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”,
		      “contact_fb_id”: “tomas”
	}
		RESPUESTA
		{  
		 "data":
		    [  
		         {     "message":"como va?",
		             "receiver_id":"tomas",
		             "sender_id":"aran.com.ar@gmail.com",
		             "timestamp":"2016-11-05 18:48:03"
		          },
		          {  
		             "message":"hola",
		             "receiver_id":"aran.com.ar@gmail.com",
		             "sender_id":"tomas",
		             "timestamp":"2016-11-05 18:44:22"
		          }
		     ]
		 ,
		 "errors":[  


		 ]
	}


	

Servicio de envio de mensajes
===============================

.. code-block:: json

	URL
		URL: http://<appserver>/api/message
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      “contact_fb_id” : “tomas”,
		      “message” : “Hola, como te va?”
	}
		RESPUESTA
		{  
		 "data":
		    {  
		       "message":"Mensaje enviado exitosamente",
		       "status":"OK"
		    }
		,
		 "errors":{}
	}


Servicio de consulta de perfil de otros usuarios
=====================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/profile/others
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”,
		      "contact_fb_id": “other_fb_id”
	}
		RESPUESTA
		{  
		 "data":[  
		    {  
		       "user":{  
		          "city":"",
		          "contacts":1,
		          "dob":"11/07/1991",
		          "email":"",
		          "job_positions":[  


		          ],
		          "name":"Tomas Mussi",
		          "profile_photo":"",
		          "requests":[  


		          ],
		          "skills":[  


		          ],
		          "summary":"A summary"
		       }
		    }[a]
		 ],
		 "errors":[  
		 ]
	}
	



Servicio de consulta de perfil
===============================

.. code-block:: json

	URL
		URL: http://<appserver>/api/profile
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”
	}
		RESPUESTA
		{  
		 "data"[  
		    {  
		       "user":{  
		          "city" : "Ciudad de Buenos Aires",
		          "contacts":1,
		          "dob" : "11/07/1991",
		          "email":"tomasmussi@gmail.com",
		          "job_positions":[  


		          ],
		          "name":"",
		          "profile_photo" : "QURQIEdtYkgK...mdHVuZw==",
		          "requests":[ 
		          ],
		          "skills":[  
		             "c",
		             "c++"
		          ],
		         "summary" : "Estudiante de ingenieria informatica de la UBA."
		       }
		    }
		 ],[b]
		 "errors":[  
		 ]
	}



Servicio de administración de perfil de usuario
===================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/profile/
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      "name": "Tomas Mussi Reyero”,
		      “summary” : “Estudiante de ingenieria informatica de la UBA.”,
		      “profile_photo” : “QURQIEdtYkgK...mdHVuZw==”,
	}
		RESPUESTA
		{
		"data": [
		  {
		    "message": "Usuario modificado exitosamente",
		    "status": "OK"
		  }
		],
		"errors": []
	}


	

Servicio de administración de skills de usuario
=====================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/skills
		HTTP VERB
		GET
		PARAMETROS
	

		RESPUESTA
		{
		      "skills": [{
		              "name": "c",
		              "description": "c programming language",
		              "category": "software"
		      }, {
		              "name": "PMI",
		              "description": "Project Management Institute",
		              "category": "management"
		      }],
		      "metadata": {
		              "version": "0.1",
		              "count": 2
		      }
	}

Servicio de administración de agregar un skill al usuario
=================================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/skills
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      "skill": “c”
	}
		RESPUESTA
		{
		"data": [
		  {
		    "message": "Skill agregado",
		    "status": "OK"
		  }
		],
		"errors": []
	}
	
Servicio de administración de eliminación de un skill de usuario
=======================================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/skills
		HTTP VERB
		DELETE
		PARAMETROS
		{
		      "token": “hash”,
		      "skill": “c”
	}
		RESPUESTA
		{
		"data": [
		  {
		    "message": "Skill eliminado",
		    "status": "OK"
		  }
		],
		"errors": []
	}


	

Servicio de administración de obtención de un skill en particular
=================================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/skill
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”,
		      "name": “c”,
	}
		RESPUESTA
		{
		"data": [
	 {
		      "name": "c",
		      "description": "c programming language",
		      "category": "software"
	}
		],
		"errors": []
	}

Servicio de administración de job positions de usuario
==============================================================

.. code-block:: json
	
	URL
		URL: http://<appserver>/api/job_positions
		HTTP VERB
		GET
		PARAMETROS
	

		RESPUESTA
		{
		      "job_positions": [{
		              "name": "developer",
		              "description": " a software developer"                         
		              "category": "software"
		      }, {


		              "name": "project manager",
		              "description": " a project manager"                         
		              "category": "management"
		      }, {
		              "name": "dj",
		              "category": "music"
		      }],
		      "metadata": {
		              "version": "0.1",
		              "count": 3
		      }
	}
	


Servicio de administración de agregar un job positions al usuario
==================================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/job_positions
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      "job": “developer”
	}
		RESPUESTA
		{
		"data": [
		  {
		    "message": "Job position agregado",
		    "status": "OK"
		  }
		],
		"errors": []
	}


	

Servicio de administración de eliminación de un job position de usuario
===========================================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/job_positions
		HTTP VERB
		DELETE
		PARAMETROS
		{
		      "token": “hash”,
		      "job": “developer”
	}
		RESPUESTA
		{
		"data": [
		  {
		    "message": "Job position eliminado",
		    "status": "OK"
		  }
		],
		"errors": []
	}


Servicio de administración de obtención de un jobPosition en particular
============================================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/job_position
		HTTP VERB
		GET
		PARAMETROS
		{
		      "token": “hash”,
		      "name": “developer”,
	}
		RESPUESTA
		{
		"data": [
	 {
		      "name": "developer",
		      "description": " a software developer"                         
		      "category": "software"
	}
		],
		"errors": []
	}


	

Servicio de registración de token Firebase Cloud Messages
========================================================================

.. code-block:: json

	URL
		URL: http://<appserver>/api/token_FCM
		HTTP VERB
		POST
		PARAMETROS
		{
		      "token": “hash”,
		      "token_FCM": “hash”,
	}
		RESPUESTA
		{
		"data": 
	 {
		      "message": "El token ha sido registrado satisfactoriamente",
		      "status": "OK"
	},
		"errors": []
	}

