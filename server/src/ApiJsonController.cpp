#include "ApiJsonController.h"

ApiJsonController::ApiJsonController(DBHandler *database_handler) : database_handler_(database_handler) {
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
}


void ApiJsonController::hello(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	int i;
	for (i=0; i<12; i++) {
		response["users"][i]["Name"] = "Bob";
	}
	response["timestamp"] = (int)time(NULL);
}

void ApiJsonController::testdb(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	std::string key = request.get("padron", "padron");
	std::cout << "Looking for key: " << key << std::endl;
	response["padron"] = database_handler_->get_value(key);
}