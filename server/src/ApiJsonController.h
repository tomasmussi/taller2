#ifndef APP_SERVER_APIJSONCONTROLLER_H
#define APP_SERVER_APIJSONCONTROLLER_H

#include <mongoose/JsonController.h>
#include "DBHandler.h"

class ApiJsonController : public Mongoose::JsonController {
	private:
		/* Database connection to leveldb */
		DBHandler *database_handler_;
		const std::string SALT;
		std::map<std::string, std::string> user_tokens_;
		std::map<std::string, std::string> users_;

		/* Loads existing users from database */
		void load_users();

		/* Generates user token authentication */
		std::string generate_token(std::string user);

		/* Checks user is logged in */
		bool is_user_logged(Mongoose::Request &request);

		/* Does the real work of login */
		bool _login(std::string user, std::string pass);

	public:
		ApiJsonController(DBHandler *database_handler);
		~ApiJsonController();
		virtual void setup();
		/* HEROKU curl*/
		void hello(Mongoose::Request &request, Mongoose::JsonResponse &response);
		void testdb(Mongoose::Request &request, Mongoose::JsonResponse &response);

		/* Login service */
		void login(Mongoose::Request &request, Mongoose::JsonResponse &response);

		/* Logout service */
		void logout(Mongoose::Request &request, Mongoose::JsonResponse &response);

		/* Heroku derived web service */
		void job_positions(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void my_profile(Mongoose::Request &request, Mongoose::JsonResponse &response);
};


#endif /* APP_SERVER_APIJSONCONTROLLER_H */