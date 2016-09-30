#include "ApiJsonController.h"

#include <json/json.h>

#include <curlpp/cURLpp.hpp>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>
#include "md5.h"


ApiJsonController::ApiJsonController(DBHandler *database_handler) : database_handler_(database_handler),
		SALT("46995e90c43683a2fe66f3202b81b753"),
		user_tokens_(),
		users_() {
	std::string key = "users";
	// TODO(tomas) Comentar esta linea una vez que funcionen los usuarios.
	database_handler_->write(key, "{\"users\":[{\"user-tomas\":\"tomas\"},{\"user-luis\":\"luis\"}]}");
	// La idea es darlos de alta desde otro servicio y hacer un append a esta lista
	database_handler_->write("user-tomas", "tomas");
	database_handler_->write("user-luis", "luis");
	load_users();
}

ApiJsonController::~ApiJsonController() {
}

void ApiJsonController::load_users() {
	std::string value = database_handler_->read("users");
	// std::cout << "value: " << value << std::endl;
	Json::Value root;
	Json::Reader reader;
	reader.parse(value, root);
	for (unsigned int i = 0; i < root["users"].size(); i++) {
		std::string key = root["users"][i].getMemberNames()[0];
		users_[key] = root["users"][i][key].asString();
	}
}

void ApiJsonController::setup() {

	setPrefix("/api");

	registerRoute("GET", "/hello",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::hello));

	registerRoute("GET", "/login",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::login));
	registerRoute("GET", "/logout",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::logout));

	registerRoute("GET", "/job_positions",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::job_positions));

}

void ApiJsonController::hello(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["status"] = "ERROR";
		response["prueba"] = "Usuario no autorizado para realizar accion";
		return;
	}
	response["users"][0]["user-tomas"] = "tomas";
	response["users"][1]["user-luis"] = "luis";
}

bool ApiJsonController::is_user_logged(Mongoose::Request &request) {
	std::string request_token = request.get("token", "no-token");
	if (request_token.compare("no-token") == 0) {
		return false;
	}
	if (user_tokens_.find(request_token) == user_tokens_.end()) {
		return false;
	}
	return true;
}


std::string ApiJsonController::generate_token(std::string user) {
	return md5(user + this->SALT);
}

bool ApiJsonController::_login(std::string user, std::string pass) {
	std::string key = "user-" + user;
	std::string value = database_handler_->read(key);
	if (value.empty()) {
		return false;
	}
	if (value.compare(pass) != 0) {
		return false;
	}
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
		std::string token = generate_token(user);
		user_tokens_[token] = user;
		response["token"] = token;
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
	std::string token = request.get("token", "");
	user_tokens_.erase(token);
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

