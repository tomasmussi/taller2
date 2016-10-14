#include "ApiJsonController.h"
#include "DatabaseHandler.h"
#include "HerokuService.h"
#include "UserHandler.h"
#include "User.h"

#include <json/json.h>

#include "md5.h"
#include <sstream>

ApiJsonController::ApiJsonController() : SALT("46995e90c43683a2fe66f3202b81b753"),
		API_SEC_KEY("7dd52e16c17ff193362961b387687bf8"),
		user_tokens_() {
	std::string key = "users";
	// TODO(tomas) Comentar esta linea una vez que funcionen los usuarios.
	DatabaseHandler::get_instance().write(key, "{\"users\":[ \"user-tomasmussi\", \"user-luis\"]}");
	// La idea es darlos de alta desde otro servicio y hacer un append a esta lista
	DatabaseHandler::get_instance().write("user-luis", "{\"user\" : {	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\",\"pass\" : \"luis\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"El number one\", \"skills\": [1, 2], \"contacts\" : 10, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }");
	DatabaseHandler::get_instance().write("user-tomasmussi", "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\",\"pass\" : \"tomas\", \"dob\" : \"11/07/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"Estudiante de ingenieria informatica de la UBA.\", \"skills\": [1, 2], \"contacts\" : 4, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }");

	DatabaseHandler::get_instance().delete_key("user-a-fb-id");
}

ApiJsonController::~ApiJsonController() {
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

	registerRoute("GET", "/categories",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::categories));

	registerRoute("GET", "/skills",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::skills));

	registerRoute("GET", "/my_profile",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::my_profile));

	registerRoute("GET", "/fb_login",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::fb_login));

	registerRoute("GET", "/edit",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::edit));

	registerRoute("PUT", "/new_user",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::new_user));
}

void ApiJsonController::new_user(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	std::string user =  request.get("fb_id","");
	std::string key = "user-" + user;
	std::string value = DatabaseHandler::get_instance().read("users");
	if (value.empty()) {
		return ;
	}

	Json::Value root;
	Json::Reader reader;
	reader.parse(value, root);
	Json::Value newUser;
	newUser[key] = request.get("name","");
	root["users"].append(newUser);
	std::ostringstream convertidor;
	convertidor << root;
	DatabaseHandler::get_instance().write("users", convertidor.str());
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	Json::Value data;
	data["status"] = "OK";
	data["message"] = "Usuario dado de alta";
	response["data"].append(data);
}

void ApiJsonController::edit(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);

	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	User user = UserHandler::get_instance().get_user(user_tokens_[request.get("token", "")]);
	user.replace_not_null("name", request.get("name","empty"));
	user.replace_not_null("email", request.get("email","empty"));
	user.replace_not_null("dob", request.get("dob","empty"));
	user.replace_not_null("city", request.get("city","empty"));
	user.replace_not_null("summary", request.get("summary","empty"));
	user.replace_not_null("profile_photo", request.get("profile_photo","empty"));

	UserHandler::get_instance().save_user(user);
	Json::Value data;
	data["status"] = "OK";
	data["message"] = "Usuario modificado existosamente";
	response["data"].append(data);
}

void ApiJsonController::hello(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	Json::Value data;
	data["users"][0]["user-tomas"] = "tomas";
	data["users"][1]["user-luis"] = "luis";
	response["data"].append(data);


	User tomas("{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\",\"pass\" : \"tomas\", \"dob\" : \"11/07/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"Estudiante de ingenieria informatica de la UBA.\", \"skills\": [1, 2], \"contacts\" : 4, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }");
	std::cout << tomas.serialize() << std::endl;

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
	std::string value = DatabaseHandler::get_instance().read(key);
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
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	std::string user = request.get("user", "(unknown)");
	std::string pass = request.get("pass", "(unknown)");
	if (user.compare("(unknown)") == 0 || pass.compare("(unknown)") == 0) {
		response["status"] = "ERROR";
		response["message"] = "Usuario o contraseña invalidos";
		return;
	}
	if (this->_login(user, pass)) {
		Json::Value data;
		std::string token = generate_token(user);
		user_tokens_[token] = user;
		data["token"] = token;
		data["requests"] = "Falta implementar";
		data["new_messages"] = 5;
		response["data"].append(data);
	} else {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario o contrasenia invalidos";
		response["errors"].append(errors);
	}

}

void ApiJsonController::logout(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	std::string token = request.get("token", "");
	user_tokens_.erase(token);
	Json::Value data;
	data["status"] = "OK";
	data["message"] = "Deslogueado exitosamente";
	response["data"].append(data);
}

void ApiJsonController::job_positions(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	HerokuService service("https://guarded-sands-84788.herokuapp.com", "job_positions");
	service.overload_response(response);
}

void ApiJsonController::categories(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	HerokuService service("https://guarded-sands-84788.herokuapp.com", "categories");
	service.overload_response(response);
}

void ApiJsonController::skills(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	HerokuService service("https://guarded-sands-84788.herokuapp.com", "skills");
	service.overload_response(response);
}

void ApiJsonController::my_profile(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	std::string user_name = user_tokens_[request.get("token", "")];
	if (UserHandler::get_instance().user_exists(user_name)) {
		User user = UserHandler::get_instance().get_user(user_name);
		Json::Value root;
		Json::Reader reader;
		reader.parse(user.serialize(), root);
		response["data"].append(root);
	}
}

void ApiJsonController::fb_login(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	std::string api_sec = request.get("api_sec", "");
	std::string fb_user_id = request.get("fb_user_id", "");
	if (api_sec.compare(API_SEC_KEY) != 0) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Security Api invalido";
		response["errors"].append(errors);
		return;
	}
	if (fb_user_id.empty()) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Facebook user ID invalido";
		response["errors"].append(errors);
		return;
	}
	if (! UserHandler::get_instance().user_exists(fb_user_id)) {
		UserHandler::get_instance().create_user(fb_user_id);
	}
	std::string token = md5(fb_user_id + SALT);
	user_tokens_[token] = fb_user_id;
	Json::Value data;
	data["token"] = token;
	response["data"].append(data);
}

