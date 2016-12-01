Objetivo
=============

Exponer al programador cómo se realizaron tests sobre la aplicación, describir paso a paso la forma de ejecutar los tests y explicar cómo mantener y mejorar los mismos.

Realización
=============
Los tests están realizados para verificar la funcionalidad principalmente del app server, desarrollado en C++. Dichos tests se realizaron con el framework de testing de Google [1].
Los mismos verifican el comportamiento unitario de las clases del servidor.
Los tests de funcionalidad de la ApiREST se desarrollaron en python.

Ejecución
=============
Para ejecutar las pruebas, deben seguirse los pasos de compilación del servidor especificados en la documentación técnica del app server [2], pero en vez de ejecutar el binario del servidor src/server, se debe ejecutar el binario generado testing que se encuentra dentro de la carpeta test.

Coverage
============
Para medir el coverage se debe ejecutar el script ./coverage.sh. Si se tiene instalado el firefox se abre automaticamente, sino se debe abrir la web generada en el archivo index en la carpeta coverage dentro de este mismo directorio.
Este test queda a la espera de que uno cierre el test dado que se deben ejecutar las pruebas de la ApiRest y las mismas necesitan que el AppServer esté corriendo. 
Se debe ir al directorio /server/test/ y ejectutar bash ./python/test.sh cuando finalicen los test se puede finalizar el Appserver.

Referencias
==============
* [1]: Google test framework para c/c++: `<https://github.com/google/googletest>`_
* [2]: Documentación técnica app server: `<https://docs.google.com/document/d/1Db988RfcEOvXmyQ6PIe9AO_NscSqZUgfGTnTWRT6-60/edit#heading=h.abohzj50eg4c>`_
