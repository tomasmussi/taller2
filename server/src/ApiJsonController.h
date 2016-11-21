#ifndef APP_SERVER_APIJSONCONTROLLER_H
#define APP_SERVER_APIJSONCONTROLLER_H

#include <mongoose/JsonController.h>

#define HTTP_CODE_BAD_REQUEST 400

class ApiJsonController : public Mongoose::JsonController {
	private:
		const std::string SALT;
		const std::string API_SEC_KEY;
		const std::string HEROKU_URL;
		std::map<std::string, std::string> user_tokens_;

		/* Loads existing users from database */
		void load_users();

		/* Generates user token authentication */
		std::string generate_token(std::string user);

		/* Checks user is logged in */
		bool is_user_logged(Mongoose::Request &request);

		/* Does the real work of login */
		bool _login(std::string user, std::string pass);

	public:
		ApiJsonController();
		ApiJsonController(std::string heroku_url);
		~ApiJsonController();
		virtual void setup();

		/* Logout service */
		void logout(Mongoose::Request &request, Mongoose::JsonResponse &response);

		/* Heroku derived web service */
		void job_positions(Mongoose::Request &request, Mongoose::JsonResponse &response);

		/* Heroku derived web service */
		void categories(Mongoose::Request &request, Mongoose::JsonResponse &response);

		/* Heroku derived web service */
		void skills(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void my_profile(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void profile(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void fb_login(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void edit(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void new_user(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void add_contact(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void answer_contact(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void get_requests_list(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void lookup(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void get_contacts(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void vote(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void popular(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void add_skill(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void delete_skill(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void get_skill(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void add_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void delete_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void get_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void send_message(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void view_messages(Mongoose::Request &request, Mongoose::JsonResponse &response);

		void location(Mongoose::Request &request, Mongoose::JsonResponse &response);
};


#endif /* APP_SERVER_APIJSONCONTROLLER_H */
