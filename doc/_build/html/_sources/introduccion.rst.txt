Introducción
==============

El trabajo práctico consta de 4 aplicaciones que funcionan para dar servicio a Jobify, una red social de profesionales.

* **AppAndroid**: aplicación android que permite a un usuario registrarse, editar su perfil en la red social, chatear, votar, encontrar profesionales cercanos y agregar contactos a la lista de amigos. Desarrollado en Android

* **AppServer**: servidor responsable de toda la lógica de Jobify, da servicios a la aplicación android. Además persiste todos los datos del usuario. Desarrollado en c++ y levelDB como base de datos.

* **SharedServer**: servidor que contiene datos de uso común de la aplicación. Utilizando Heroku para hacer un deploy de la aplicación. Desarrollado en node.js y postgreSQL como base de datos  

* **WebAdmin**: web que permite editar los datos utilizado por el SharedServer. 


