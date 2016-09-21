#ifndef APP_SERVER_APIJSONCONTROLLER_H
#define APP_SERVER_APIJSONCONTROLLER_H

#include <mongoose/JsonController.h>
#include "DBHandler.h"

class ApiJsonController : public Mongoose::JsonController {
	private:
		DBHandler *database_handler_;
		const std::string SALT;

		bool is_user_logged();
		std::string generate_token(std::string user);

	public:
		ApiJsonController(DBHandler *database_handler);
		~ApiJsonController();
		virtual void setup();
		void hello(Mongoose::Request &request, Mongoose::JsonResponse &response);
		void testdb(Mongoose::Request &request, Mongoose::JsonResponse &response);
		void login(Mongoose::Request &request, Mongoose::JsonResponse &response);
};


#endif /* APP_SERVER_APIJSONCONTROLLER_H */