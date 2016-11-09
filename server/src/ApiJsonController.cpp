#include "ApiJsonController.h"
#include "DatabaseHandler.h"
#include "HerokuService.h"
#include "Message.h"
#include "UserHandler.h"
#include "User.h"
#include "log.h"
#include <json/json.h>

#include "md5.h"
#include <sstream>

ApiJsonController::ApiJsonController() : SALT("46995e90c43683a2fe66f3202b81b753"),
		API_SEC_KEY("7dd52e16c17ff193362961b387687bf8"),
		HEROKU_URL("https://guarded-sands-84788.herokuapp.com"),
		user_tokens_() {
}

ApiJsonController::~ApiJsonController() {
}

void ApiJsonController::setup() {

	setPrefix("/api");

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

	registerRoute("GET", "/profile",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::profile));

	registerRoute("GET", "/fb_login",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::fb_login));

	registerRoute("GET", "/edit",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::edit));

	registerRoute("POST", "/add_contact",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::add_contact));

	registerRoute("GET", "/accept_contact",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::answer_contact));

	registerRoute("GET", "/lookup",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::lookup));

	registerRoute("GET", "/get_contacts",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::get_contacts));

	registerRoute("GET", "/vote",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::vote));

	registerRoute("GET", "/popular",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::popular));

	registerRoute("GET", "/add_skill",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::add_skill));

	registerRoute("DELETE", "/delete_skill",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::delete_skill));

	registerRoute("GET", "/get_skill",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::get_skill));

	registerRoute("GET", "/add_job_position",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::add_job_position));

	registerRoute("DELETE", "/delete_job_position",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::delete_job_position));

	registerRoute("GET", "/get_job_position",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::get_job_position));

	registerRoute("POST", "/send_message",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::send_message));

	registerRoute("GET", "/view_messages",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::view_messages));
}

void ApiJsonController::edit(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);

	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario o contraseña invalidados");
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
	data["message"] = "Usuario modificado exitosamente";
	Log::get_instance()->log_info("Usuario modificado exitosamente");
	response["data"].append(data);
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
		Log::get_instance()->log_info("Usuario o contraseña invalidados");
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
		Log::get_instance()->log_info("Usuario o contraseña invalidados");
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
	HerokuService service(HEROKU_URL, "job_positions");
	service.overload_response(response);
}

void ApiJsonController::categories(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	HerokuService service(HEROKU_URL, "categories");
	service.overload_response(response);
}

void ApiJsonController::skills(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	if (!is_user_logged(request)) {
		response["errors"]["status"] = "ERROR";
		response["errors"]["message"] = "Usuario no autorizado para realizar accion";
		return;
	}
	HerokuService service(HEROKU_URL, "skills");
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

void ApiJsonController::profile(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	std::string user_id = request.get("contact_fb_id", "");
	if (user_id.empty() || !UserHandler::get_instance().user_exists(user_id)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario vacio o inválido";
		response["errors"].append(errors);
		return;
	}
	User user = UserHandler::get_instance().get_user(user_id);
	Json::Value root;
	Json::Reader reader;
	reader.parse(user.serialize(), root);
	response["data"].append(root);
}

void ApiJsonController::add_contact(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string wanted_user_id = request.get("contact_fb_id", "");
	if (UserHandler::get_instance().user_exists(user_logged_id)
		&& UserHandler::get_instance().user_exists(wanted_user_id)) {
		UserHandler::get_instance().send_request(user_logged_id, wanted_user_id);
	} else {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "El usuario no existe";
		response["errors"].append(errors);
		return;
	}
	Json::Value data;
	data["status"] = "OK";
	data["message"] = "Enviada solicitud a contacto";
	response["data"].append(data);
}

void ApiJsonController::answer_contact(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string wanted_user_id = request.get("contact_fb_id", "");
	std::string accepted = request.get("accept", ""); // "true" / "false"
	if (accepted.empty()) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "No se envio respuesta si acepta o rechaza";
		response["errors"].append(errors);
		return;
	}
	if (UserHandler::get_instance().user_exists(user_logged_id)
		&& UserHandler::get_instance().user_exists(wanted_user_id)) {
		UserHandler::get_instance().answer_request(user_logged_id, wanted_user_id, accepted.compare("true") == 0);
	} else {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "El usuario no existe";
		response["errors"].append(errors);
		return;
	}
	Json::Value data;
	data["status"] = "OK";
	response["data"].append(data);
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
		Log::get_instance()->log_info("Facebook user ID invalidado");
		return;
	}
	bool user_exists = UserHandler::get_instance().user_exists(fb_user_id);
	if (! user_exists) {
		UserHandler::get_instance().create_user(fb_user_id);
	}
	std::string token = md5(fb_user_id + SALT);
	user_tokens_[token] = fb_user_id;
	Json::Value data;
	data["token"] = token;
	data["user_exists"] = ((user_exists) ? "true" : "false");
	response["data"].append(data);
}


void ApiJsonController::lookup(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado para ejecutar lookup");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string lookup_name = request.get("query", "");

	Json::Value data(Json::arrayValue);
	UserHandler::get_instance().lookup(user_logged_id, lookup_name, data);
	response["data"].append(data);
}


void ApiJsonController::get_contacts(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizaro para get_contacts");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];


	Json::Value data(Json::arrayValue);
	UserHandler::get_instance().load_friends(user_logged_id, data);
	response["data"].append(data);
}

void ApiJsonController::vote(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado para votar");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string voted_user_id = request.get("contact_fb_id", "");
	if (voted_user_id.empty() || !UserHandler::get_instance().user_exists(voted_user_id)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario [" + voted_user_id + "] no existe o no es valido";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario [" + voted_user_id + "] no existe o no es valido");
		return;
	}
	bool success = UserHandler::get_instance().user_vote(user_logged_id, voted_user_id);

	Json::Value data;
	if (success) {
		data["status"] = "OK";
		data["message"] = "Enviada votacion a contacto";
	} else {
		data["status"] = "ERROR";
		data["message"] = "No puede votar por contactos que no son amigos o por ud mismo";
	}
	Log::get_instance()->log_info("Enviada votacion a contacto " + voted_user_id);
	response["data"].append(data);
}


void ApiJsonController::popular(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - popular");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	User me = UserHandler::get_instance().get_user(user_logged_id);
	vote_queue most_pop = UserHandler::get_instance().most_popular();
	Json::Value data(Json::arrayValue);
	int count = 0;
	while (!most_pop.empty() && count < 10) {
		Json::Value user;
		User it = most_pop.top();
		user["fb_id"] = it.id();
		user["name"] = it.get_name();
		user["photo"] = it.get_profile_photo();
		user["votes"] = it.votes();
		user["is_contact"] = (me.is_friend(it) ? "true" : "false");
		data.append(user);
		most_pop.pop();
		count++;
	}
	response["data"].append(data);
}

void ApiJsonController::add_skill(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - add skill");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string new_skill = request.get("skill", "");
	if (!new_skill.empty()) {
		UserHandler::get_instance().add_user_skill(user_logged_id, new_skill);
		Json::Value data;
		data["status"] = "OK";
		data["message"] = "Skill agregado";
		response["data"].append(data);
	} else {
		Log::get_instance()->log_info("Skill vacio - add skill");
	}
}

void ApiJsonController::delete_skill(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - delete skill");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string new_skill = request.get("skill", "");
	if (new_skill.empty()) {
		UserHandler::get_instance().delete_user_skill(user_logged_id, new_skill);
		Json::Value data;
		data["status"] = "OK";
		data["message"] = "Enviada solicitud a contacto";
		response["data"].append(data);
	} else {
		Log::get_instance()->log_info("Skill vacio - delete skill");
	}
}

void ApiJsonController::get_skill(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - get skill");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string name = request.get("name", "");
	HerokuService service(HEROKU_URL, "skills");
	response["data"].append(service.get_data(name, "skills"));
}

void ApiJsonController::add_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - add job");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string new_job = request.get("job", "");
	if (new_job.empty()) {
		UserHandler::get_instance().add_user_job(user_logged_id, new_job);
		Json::Value data;
		data["status"] = "OK";
		data["message"] = "Enviada solicitud a contacto";
		response["data"].append(data);
	} else {
		Log::get_instance()->log_info("Job vacio - add job");
	}
}

void ApiJsonController::delete_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - delete job");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string new_job_position = request.get("job", "");
	if (new_job_position.empty()) {
		UserHandler::get_instance().delete_user_job(user_logged_id, new_job_position);
		Json::Value data;
		data["status"] = "OK";
		data["message"] = "Enviada solicitud a contacto";
		response["data"].append(data);
	} else {
		Log::get_instance()->log_info("Job vacio - delete job");
	}
}

void ApiJsonController::get_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - get job position");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string name = request.get("name", "");
	HerokuService service(HEROKU_URL, "job_positions");
	response["data"].append(service.get_data(name, "job_positions"));
}

void ApiJsonController::send_message(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - send_message");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string message = request.get("message", "");
	std::string receiver_id = request.get("contact_fb_id", "");
	if (message.empty()) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Mensaje vacio";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Envio de mensaje vacio");
		return;
	}
	if (receiver_id.empty() || !UserHandler::get_instance().user_exists(receiver_id)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario [" + receiver_id + "] no existe o no es valido";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario [" + receiver_id + "] no existe o no es valido");
		return;
	}
	UserHandler::get_instance().send_message(user_logged_id, receiver_id, message);
	Json::Value data;
	data["status"] = "OK";
	data["message"] = "Mensaje enviado exitosamente";
	response["data"].append(data);
}

void ApiJsonController::view_messages(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["data"] = Json::Value(Json::arrayValue);
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - send_message");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string receiver_id = request.get("contact_fb_id", "");
	std::string limit = request.get("limit", "10");
	if (receiver_id.empty() || !UserHandler::get_instance().user_exists(receiver_id)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario [" + receiver_id + "] no existe o no es valido";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario [" + receiver_id + "] no existe o no es valido");
		return;
	}
	std::list<Message> messages = UserHandler::get_instance().view_messages(user_logged_id, receiver_id, limit);

	Json::Value data;
	data["status"] = "OK";
	data["messages"] = Json::Value(Json::arrayValue);

	for (std::list<Message>::iterator it = messages.begin(); it != messages.end(); ++it) {
		data["messages"].append((*it).serialize());
	}
	response["data"].append(data);
}

