Objetivo
================================

Documentar información técnica de la aplicación android para poder compilar, ejecutar, debuggear, extender y mejorar la misma

Requisitos
===============================
La aplicación fue desarrollada en Android studio y su SDK [1]

Otros componentes adicionales que se utilizaron fueron

* **Firebase** [2] como una plataforma movil que se encarga de la autentificación de los usuarios mediante cuentas de facebook, gmail.
* **Firebase Cloud Messages** [3] servicio provisto por Firebase para proveer a nuestra app de notificaciones

Distribución
=================================
El código puede ser descargado de la página oficial de github [4].


Sistema operativo
==========================================
El desarrollo de la aplicación se ha realizado en Android Studio siendo ejecutado el mismo bajo el sistema operativo Linux. De querer desarrollar en Windows o Mac, no se garantiza el correcto funcionamiento de la misma 

*La aplicación funciona una vez compilada solamente en sistemas operativos Android*

Compilación
=============
La aplicación ha sido compilada e instalada en celulares y emuladores provisto por android studio con una API mayor a 21

Descripción del proyecto
========================
Está formado por los siguientes paquetes.

* **activities**: Contiene el comportamiento de cada una de las pantallas.

* **adapters**: Utilizado para definir los adapters que contiene la aplicación.

* **domain**: Contiene las clases del dominio del problema

* **rest_dto**: Contiene las clases que modelan la serialización e hidratación de los datos desde un json a clases de dominio.

* **services**: Contiene cada uno de los servicios que interactuan con el appServer.

Explicación de como agregar un servicio
=======================================

Agregar una clase de servicio nueva
---------------------------------------

En este caso agregamos de ejemplo un servicio existente en la aplicación.

* Se debe crear un servicio que herede de AbstractServices.

.. code-block:: java

	public class GetSkillServices extends AbstractServices {
		  private static final String service_name = "api/skill";
	...}

donde *service_name* indica el nombre del servicio a consultar 

.. code-block:: java

    public Skill get(String nameSkill) {
        String query = this.getQueryBy(nameSkill);

hay que definir el metodo get() que es el que nos va a permitir obtener el objeto hidratado ya con el estado valido segun la consulta realizada

.. code-block:: java

    public Skill get(String nameSkill) {
        ...
        SkillDTO skillDTO = (SkillDTO) getDataOftDTO(query, SkillDTO.class);
        return skillDTO.getData();
    }

Vemos como hay que instanciar un dto, el mismo nos va a permitir según la query que obtuvimos generar el objeto correspondiente.


.. code-block:: java

	@Override
		  protected String getQueryBy(String... params) {
		      String nameSkill = params [0];

		      String url = urlBase;
		      StringBuffer urlStringBuffer = new StringBuffer(url);
		      urlStringBuffer.append(service_name);
		      urlStringBuffer.append("?");
		      urlStringBuffer.append("token=");
		      urlStringBuffer.append(api_security);
		      urlStringBuffer.append("&name=");
		      urlStringBuffer.append(nameSkill);
		      System.out.println(urlStringBuffer.toString());
		      return urlStringBuffer.toString();
		  }}

Con el metodo getQueryBy formamos la consulta del servicio. Solamente hay que especificar el service_name y todos los atributos correspondiente a ese servicio.

Agregar un DTO
---------------

.. code-block:: java

	@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
	@JsonIgnoreProperties(ignoreUnknown = true)

	public class SkillDTO extends AbstractDTO {
		  public Skill getData() {
		      return (Skill) data;
		  }

		  public void setData(Skill data) {
		      this.data = data;
		  }

		  public String[] getErrors() {
		      return (String[]) errors;
		  }

		  public void setErrors(String[] errors) {
		      this.errors = errors;
		  }
	}


Se debe definir los metodos *getData* *setData* *getErrors* y *setErrors*

Todo clase que hereda de AbstractServices contiene los metodos
*getDataofDTO*, *postDataofDTO*, *deleteDataofDTO* y *putDataOfDto*
que es donde se coloca la lógica que permite transfomar una query en un objeto que pertenece a una clase del dominio del problema.

Definir la clase contenedora de la información
-----------------------------------------------
Se debe definir la clase que nos va a permitir manejar la información que nos va a devolver el getData del DTO. 
Se le deben definir los atributos correspondientes y sus getters y setters.

Contacto
===========

Por cualquier inquietud, duda, consulta, usted puede enviar un email a la casilla de correos `<linkedunservices@gmail.com>`_ y se le responderá a la brevedad.
También puede contribuir al proyecto, reportar bugs, etc en la página de github del proyecto.

Referencias
=============
* [1] Android Studio: `<https://developer.android.com/studio/index.html?hl=es-419>`_
* [2] Firebase: `<https://firebase.google.com/?hl=es>`_
* [3] Firebase Cloud Messages: `<https://firebase.google.com/docs/cloud-messaging/?hl=es>`_
* [4] Código del repositorio oficial de Linkedun: `<https://github.com/tomasmussi/taller2>`_

