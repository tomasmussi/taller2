#include "ApiJsonController.h"

#include <curlpp/cURLpp.hpp>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>
#include "md5.h"


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
	registerRoute("GET", "/logout",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::logout));

	registerRoute("GET", "/job_positions",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::job_positions));
}

void ApiJsonController::hello(Mongoose::Request &request, Mongoose::JsonResponse &response) {

	// curlpp::options::Url myUrl(std::string("http://localhost:5000/job_positions"));
	curlpp::options::Url myUrl(std::string("https://guarded-sands-84788.herokuapp.com/job_positions"));
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
	/*if (!is_user_logged()) {
		response["message"] = "No esta loggeado";
		return;
	}
	std::string key = request.get("padron", "padron");
	std::cout << "Looking for key: " << key << std::endl;
	response["padron"] = database_handler_->get_value(key);*/
	// database_handler_->test_write();
	database_handler_->write("user-tomas", "tomas");
	std::string pass = database_handler_->read("user-tomas");
	// std::cout << pass << std::endl;
}

bool ApiJsonController::is_user_logged(Mongoose::Request &request) {
	std::string request_token = request.get("token", "no-token");
	if (request_token.compare("no-token") == 0) {
		return false;
	}
	std::string user = database_handler_->read(request_token);
	if (user.empty()) {
		return false;
	}
	// std::cout << "usuario " << user << " autenticado" << std::endl;
	return true;
}


std::string ApiJsonController::generate_token(std::string user) {
	std::string token = md5(user + this->SALT);
	database_handler_->write(token, user);
	return token;
}

bool ApiJsonController::_login(std::string user, std::string pass) {
	std::string key = "user-" + user;
	std::string value = database_handler_->read(key);
	if (value.empty()) {
		// std::cout << "no existe el usuario" << std::endl;
		return false;
	}
	if (value.compare(pass) != 0) {
		return false;
	}
	// std::cout << "key: " << key << " ; value: " <<  value << std::endl;
	return true;
}

void ApiJsonController::login(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	std::string user = request.get("user", "(unknown)");
	std::string pass = request.get("pass", "(unknown)");
	if (user.compare("(unknown)") == 0 || pass.compare("(unknown)") == 0) {
		response["status"] = "ERROR";
		response["message"] = "Usuario o contraseña invalidos";
		return;
	}
	if (this->_login(user, pass)) {
		response["status"] = "OK";
		response["token"] = generate_token(user);
		response["requests"] = "Falta implementar";
		response["new_messages"] = 5;
	} else {
		response["status"] = "ERROR";
		response["message"] = "Usuario o contrasenia invalidos";
	}
}

void ApiJsonController::logout(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["status"] = "ERROR";
		response["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	std::string token = request.get("token", "no-token");
	database_handler_->delete_key(token);
	response["status"] = "OK";
	response["message"] = "Deslogueado exitosamente";
}

void ApiJsonController::job_positions(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["status"] = "ERROR";
		response["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	curlpp::options::Url myUrl(std::string("https://guarded-sands-84788.herokuapp.com/job_positions"));
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
	// std::cout << "CONSULTA: " << os.str() << std::endl;
	response["prueba"] = os.str();
}
