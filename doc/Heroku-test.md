Heroku-test
============
* Instalar python

        sudo apt-get install python

* Instalar pip

        sudo easy_install pip

         Aclaración: si no funciona instalar sudo apt-get install python-setuptools


* Instalar nose

        pip install nose
        
        sudo pip install requests                         
        sudo pip install -U mock

**Prueba de test:**

Primero asegurarse de que este corriendo el servidor localmente, si no es asi ejecutar

        heroku local web

Luego ejecutar los test con el siguiente comando

        heroku local test
