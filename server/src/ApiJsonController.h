#ifndef APP_SERVER_APIJSONCONTROLLER_H
#define APP_SERVER_APIJSONCONTROLLER_H

#include <mongoose/JsonController.h>
#include "DBHandler.h"

class ApiJsonController : public Mongoose::JsonController {
	private:
		DBHandler *database_handler_;
		const std::string SALT;

		/* Genera el token de autenticacion del usuario*/
		std::string generate_token(std::string user);

		/* Verifica que el usuario este logueado para realizar acciones */
		bool is_user_logged(Mongoose::Request &request);

		/* Realiza la verdadera accion de login */
		bool _login(std::string user, std::string pass);

	public:
		ApiJsonController(DBHandler *database_handler);
		~ApiJsonController();
		virtual void setup();
		void hello(Mongoose::Request &request, Mongoose::JsonResponse &response);
		void testdb(Mongoose::Request &request, Mongoose::JsonResponse &response);
		void login(Mongoose::Request &request, Mongoose::JsonResponse &response);
		void logout(Mongoose::Request &request, Mongoose::JsonResponse &response);
		void job_positions(Mongoose::Request &request, Mongoose::JsonResponse &response);
};


#endif /* APP_SERVER_APIJSONCONTROLLER_H */