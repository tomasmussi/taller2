#include "ApiJsonController.h"

#include <json/json.h>

#include <curlpp/cURLpp.hpp>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>
#include "md5.h"


ApiJsonController::ApiJsonController(DBHandler *database_handler) : database_handler_(database_handler),
		SALT("46995e90c43683a2fe66f3202b81b753"),
		API_SEC_KEY("7dd52e16c17ff193362961b387687bf8"),
		user_tokens_(),
		users_() {
	std::string key = "users";
	// TODO(tomas) Comentar esta linea una vez que funcionen los usuarios.
	database_handler_->write(key, "{\"users\":[{\"user-tomasmussi\":\"tomas\"},{\"user-luis\":\"luis\"}]}");
	// La idea es darlos de alta desde otro servicio y hacer un append a esta lista
	database_handler_->write("user-luis", "{\"user\" : {	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\",\"pass\" : \"luis\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"El number one\", \"skills\": [1, 2], \"contacts\" : 10, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }");
	database_handler_->write("user-tomasmussi", "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\",\"pass\" : \"tomas\", \"dob\" : \"11/07/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"Estudiante de ingenieria informatica de la UBA.\", \"skills\": [1, 2], \"contacts\" : 4, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }");
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

	registerRoute("GET", "/my_profile",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::my_profile));

	registerRoute("GET", "/fb_login",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::fb_login));
}

void ApiJsonController::hello(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["prueba"] = "Usuario no autorizado para realizar accion";
		return;
	}
	response["data"]["users"][0]["user-tomas"] = "tomas";
	response["data"]["users"][1]["user-luis"] = "luis";
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
	Json::Value root;
	Json::Reader reader;
	reader.parse(value, root);
	for (unsigned int i = 0; i < root["user"].size(); i++) {
		for (unsigned int j = 0; j < root["user"].getMemberNames().size(); j++) {
			std::string key = root["user"].getMemberNames()[j];
			std::string saved_pass = root["user"][key].asString();
			if (key.compare("pass") == 0 && saved_pass.compare(pass) == 0) {
				return true;
			}
		}
	}
	return false;
}

void ApiJsonController::login(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	std::string user = request.get("user", "(unknown)");
	std::string pass = request.get("pass", "(unknown)");
	if (user.compare("(unknown)") == 0 || pass.compare("(unknown)") == 0) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario o contraseña invalidos";
		return;
	}
	if (this->_login(user, pass)) {
		response["data"]["status"] = "OK";
		std::string token = generate_token(user);
		user_tokens_[token] = user;
		response["data"]["token"] = token;
		response["data"]["requests"] = "Falta implementar";
		response["data"]["new_messages"] = 5;
	} else {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario o contrasenia invalidos";
	}
}

void ApiJsonController::logout(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	std::string token = request.get("token", "");
	user_tokens_.erase(token);
	response["data"]["status"] = "OK";
	response["data"]["message"] = "Deslogueado exitosamente";
}

void ApiJsonController::job_positions(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
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
	Json::Value root;
	Json::Reader reader;
	// Creo que esto funciona de pedo...
	reader.parse(os.str(), response);
}

void ApiJsonController::my_profile(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	std::string user = user_tokens_[request.get("token", "")];
	// std::cout << "users..." << std::endl;
	for (std::map<std::string, std::string>::iterator it = user_tokens_.begin(); it != user_tokens_.end(); ++it) {
		std::cout << it->first << " = " << it->second << std::endl;
	}
	// std::cout << "looking for user: " << user << std::endl;
	std::string user_data_json = database_handler_->read("user-" + user);

	Json::Value root;
	Json::Reader reader;
	reader.parse(user_data_json, root);
	for (unsigned int i = 0; i < root["user"].getMemberNames().size(); i++) {
		std::string key = root["user"].getMemberNames()[i];
		try {
			if (key.compare("skills") == 0) {
				for (unsigned int j = 0; j < root["user"][key].size(); j++ ) {
					response["data"]["user"][key]["skills"][j] = root["user"][key][j].asInt();
				}
			} else {
				std::string value = root["user"][key].asString();
				if (key.compare("pass") != 0) {
					response["data"]["user"][key] = value;
				}
			}

		} catch (std::exception e) {
			// Se esta lanzando una exception por los skills...
			std::cout << "EXCEPTION!: " << e.what() << std::endl;
		}

	}
}

void ApiJsonController::fb_login(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	std::string api_sec = request.get("api_sec", "");
	std::string fb_user_id = request.get("fb_user_id", "");
	if (api_sec.compare(API_SEC_KEY) != 0) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Security Api invalido";
		return;
	}
	// TODO(tomas) recordar validar que no esten vacios
	std::string token = md5(fb_user_id + SALT);
	user_tokens_[token] = fb_user_id;
	response["data"]["token"] = token;
}

