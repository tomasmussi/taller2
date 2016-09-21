#include "ApiJsonController.h"

ApiJsonController::ApiJsonController(DBHandler *database_handler) : database_handler_(database_handler),
	SALT("46995e90c43683a2fe66f3202b81b753") {
}

ApiJsonController::~ApiJsonController() {
}

void ApiJsonController::setup() {
	// Example of prefix, putting all the urls into "/api"
	setPrefix("/api");
	// Hello demo
	registerRoute("GET", "/", new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::hello));
	registerRoute("GET", "/hello", new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::hello));

	registerRoute("GET", "/testdb",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::testdb));


	registerRoute("GET", "/login",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::login));
}

bool ApiJsonController::is_user_logged() {
	return false;
}


void ApiJsonController::hello(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	int i;
	for (i=0; i<12; i++) {
		response["users"][i]["Name"] = "Bob";
	}
	response["timestamp"] = (int)time(NULL);
}

void ApiJsonController::testdb(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged()) {
		response["message"] = "No esta loggeado";
		return;
	}
	std::string key = request.get("padron", "padron");
	std::cout << "Looking for key: " << key << std::endl;
	response["padron"] = database_handler_->get_value(key);
}

std::string ApiJsonController::generate_token(std::string user) {
	return this->SALT;
}

void ApiJsonController::login(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	std::string user = request.get("user", "(unknown)");
	std::string pass = request.get("pass", "(unknown)");
	if (database_handler_->login(user, pass)) {
		response["status"] = "OK";
		response["token"] = generate_token(user);
		response["requests"] = "Falta implementar";
		response["new_messages"] = 5;
	} else {
		response["status"] = "ERROR";
		response["message"] = "Usuario o contrasenia invalidos";
	}
}
