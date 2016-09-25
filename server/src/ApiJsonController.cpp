#include "ApiJsonController.h"

#include <curlpp/cURLpp.hpp>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>



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
	/*
	int i;
	for (i=0; i<12; i++) {
		response["users"][i]["Name"] = "Bob";
	}
	response["timestamp"] = (int)time(NULL);
	*/
	/*try
	{
		// That's all that is needed to do cleanup of used resources (RAII style).
		curlpp::Cleanup myCleanup;

		// Our request to be sent.
		curlpp::Easy myRequest;

		// Set the URL.
		myRequest.setOpt<curlpp::options::Url>("http://localhost:5000/job_positions");

		// Send request and get a result.
		// By default the result goes to standard output.
		myRequest.perform();
	}

	catch(curlpp::RuntimeError & e)
	{
		std::cout << e.what() << std::endl;
	}

	catch(curlpp::LogicError & e)
	{
		std::cout << e.what() << std::endl;
	}*/

	curlpp::options::Url myUrl(std::string("http://localhost:5000/job_positions"));
	curlpp::Easy myRequest;
	myRequest.setOpt(myUrl);

	myRequest.perform();

	std::ostringstream os;
	curlpp::options::WriteStream ws(&os);
	myRequest.setOpt(ws);
	myRequest.perform();

	// There is some shorcut within curlpp that allow you to write shorter code
	// like this:
	os << myRequest;
	std::cout << os.str() << std::endl;
	response["prueba"] = os.str();
}

void ApiJsonController::testdb(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	std::string key = request.get("padron", "padron");
	std::cout << "Looking for key: " << key << std::endl;
	response["padron"] = database_handler_->get_value(key);
}
