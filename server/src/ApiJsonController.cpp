#include "ApiJsonController.h"

ApiJsonController::ApiJsonController() {
}

ApiJsonController::~ApiJsonController() {
}

void ApiJsonController::setup() {
	// Example of prefix, putting all the urls into "/api"
	setPrefix("/api");
	// Hello demo
	/*addRouteResponse("GET", "/", ApiJsonController, hello, JsonResponse);
	addRouteResponse("GET", "/hello", ApiJsonController, hello, JsonResponse);*/
	registerRoute("GET", "/hello", new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::hello));
}


void ApiJsonController::hello(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	int i;
	for (i=0; i<12; i++) {
		response["users"][i]["Name"] = "Bob";
	}
	response["timestamp"] = (int)time(NULL);
}
