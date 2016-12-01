#include "ApiJsonController.h"
#include "DatabaseHandler.h"
#include "HerokuService.h"
#include "Message.h"
#include "UserHandler.h"
#include "User.h"
#include "log.h"
#include <json/json.h>
#include "TokenFCM.h"
#include "TokenFCMHandler.h"
#include "md5.h"
#include <sstream>
#include "Notificator.h"

ApiJsonController::ApiJsonController() : SALT("46995e90c43683a2fe66f3202b81b753"),
		API_SEC_KEY("7dd52e16c17ff193362961b387687bf8"),
		HEROKU_URL("https://guarded-sands-84788.herokuapp.com"),
		user_tokens_() {
}

ApiJsonController::ApiJsonController(std::string heroku_url) : SALT("46995e90c43683a2fe66f3202b81b753"),
		API_SEC_KEY("7dd52e16c17ff193362961b387687bf8"),
		HEROKU_URL(heroku_url),
		user_tokens_() {
}

ApiJsonController::~ApiJsonController() {
}

void ApiJsonController::setup() {

	setPrefix("/api");

	registerRoute("GET", "/fb_login",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::fb_login));

	registerRoute("GET", "/logout",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::logout));

	registerRoute("GET", "/job_positions",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::job_positions));

	/* Old GET add_job_position */
	registerRoute("POST", "/job_positions",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::add_job_position));

	/* Old delete_job_position */
	registerRoute("DELETE", "/job_positions",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::delete_job_position));

	/* Old get_job_position */
	registerRoute("GET", "/job_position",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::get_job_position));


	registerRoute("GET", "/categories",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::categories));

	registerRoute("GET", "/skills",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::skills));

	/* Old add_skill */
	registerRoute("POST", "/skill",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::add_skill));

	/* Old delete_skill */
	registerRoute("DELETE", "/skill",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::delete_skill));

	/* Old get_skill */
	registerRoute("GET", "/skill",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::get_skill));


	/* Old my_profile */
	registerRoute("GET", "/profile",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::my_profile));

	/* Old edit */
	registerRoute("POST", "/profile",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::edit));

	/* Old profile*/
	registerRoute("GET", "/profile/others",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::profile));


	/* Old add_contact */
	registerRoute("POST", "/contact",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::add_contact));

	/* Old answer_contact */
	registerRoute("POST", "/contact/response",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::answer_contact));

	/* New service */
	registerRoute("GET", "/contact",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::get_requests_list));


	registerRoute("GET", "/lookup",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::lookup));

	registerRoute("GET", "/get_contacts",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::get_contacts));

	registerRoute("POST", "/vote",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::vote));

	/* Old popular */
	registerRoute("GET", "/vote/popular",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::popular));

	/* Old send_message */
	registerRoute("POST", "/message",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::send_message));

	/* Old view_messages */
	registerRoute("GET", "/message",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::view_messages));

registerRoute("POST", "/location",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::location));

	registerRoute("GET", "/send_notification",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::send_notification));

	registerRoute("POST", "/token_FCM",
		new Mongoose::RequestHandler<ApiJsonController, Mongoose::JsonResponse>(this, &ApiJsonController::token_FCM));

}

void ApiJsonController::token_FCM(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["errors"] = Json::Value(Json::arrayValue);

	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("No se permite almacenar el token de un usuario no logueado");
		return;
	}

	std::string fb_id = request.get("user_fb_id", "");
	std::string token_FCM = request.get("token_FCM","");

	Token_FCM token(fb_id,token_FCM);

	TokenFCMHandler::get_instance().save_token(token);

	Json::Value data;
	response["data"]["status"] = "OK";
	response["data"]["message"] = "Token FCM dado de alta";
	std::ostringstream mensaje ("tocken_FCM: ");
	mensaje << token_FCM;
	mensaje << "fb_id: ";
	mensaje << fb_id;
	Log::get_instance()->log_info(mensaje.str());
}


void ApiJsonController::send_notification(Mongoose::Request &request, Mongoose::JsonResponse &response) {

	Token_FCM token("fb_id","eDSpyrzlxKQ:APA91bGBze7mTQK3OnIWJf-WTNRIYvFDbLNGsVjtMMliVRcjUF6AqsNbZhXTYcSS5srb6fSUSZ-yrB9NC7mX2hV6AjJAmF1Vz2fFuWVUX8oSDnPV1KcnStt6DNR0gyhLibjrMXuu2-MA");
	Notificator notificator(token, TYPE_NOTIFICATOR::CHAT, "HOLA");
	//notificator.send();
}

void ApiJsonController::edit(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
	response["data"]["status"] = "OK";
	response["data"]["message"] = "Usuario modificado exitosamente";
	Log::get_instance()->log_info("Usuario modificado exitosamente");
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
	response["data"]["status"] = "OK";
	response["data"]["message"] = "Deslogueado exitosamente";
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
		Json::Reader reader;
		reader.parse(user.serialize(), response["data"]);
	}
}

void ApiJsonController::profile(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
	Json::Reader reader;
	reader.parse(user.serialize(), response["data"]);
}

void ApiJsonController::add_contact(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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

		Token_FCM token = TokenFCMHandler::get_instance().read_token(wanted_user_id);
		Notificator notificator(token, TYPE_NOTIFICATOR::FRIEND_REQUEST, "Usted ha recibido una solicitud de amistad nueva");
		//notificator.send();

	} else {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "El usuario no existe";
		response["errors"].append(errors);
		return;
	}
	response["data"]["status"] = "OK";
	response["data"]["message"] = "Enviada solicitud a contacto";
}

void ApiJsonController::answer_contact(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		response.setCode(400);
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
		response.setCode(400);
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
		response.setCode(400);
		return;
	}
	response["data"]["status"] = "OK";
	response["data"]["message"] = "Respondida solicitud a contacto";
	response.setCode(201);
}

void ApiJsonController::get_requests_list(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	if (! UserHandler::get_instance().user_exists(user_logged_id)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "El usuario no existe";
		response["errors"].append(errors);
		return;
	}
	UserHandler::get_instance().get_requests(user_logged_id, response["data"]);
}

void ApiJsonController::fb_login(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	// response["data"] = Json::Value(Json::arrayValue);
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
	response["data"]["token"] = token;
	response["data"]["user_exists"] = ((user_exists) ? "true" : "false");
}


void ApiJsonController::lookup(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
	UserHandler::get_instance().lookup(user_logged_id, lookup_name, response["data"]);
}


void ApiJsonController::get_contacts(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
	UserHandler::get_instance().load_friends(user_logged_id, response["data"]);
}

void ApiJsonController::vote(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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

	if (success) {
		response["data"]["status"] = "OK";
		response["data"]["message"] = "Enviada votacion a contacto";
	} else {
		response["data"]["status"] = "ERROR";
		response["data"]["message"] = "No puede votar por contactos que no son amigos o por ud mismo";
	}
	Log::get_instance()->log_info("Enviada votacion a contacto " + voted_user_id);
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
	int count = 0;
	while (!most_pop.empty() && count < 10) {
		Json::Value user;
		User it = most_pop.top();
		user["fb_id"] = it.id();
		user["name"] = it.get_name();
		user["photo"] = it.get_profile_photo();
		user["votes"] = it.votes();
		user["is_contact"] = (me.is_friend(it) ? "true" : "false");
		user["is_friend_request_sent"] = me.is_friend_request_sent(it);
		response["data"].append(user);
		most_pop.pop();
		count++;
	}
}

void ApiJsonController::add_skill(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
		response["data"]["status"] = "OK";
		response["data"]["message"] = "Skill agregado";
	} else {
		Log::get_instance()->log_info("Skill vacio - add skill");
	}
}

void ApiJsonController::delete_skill(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
		response["data"]["status"] = "OK";
		response["data"]["message"] = "Skill eliminado";
	} else {
		Log::get_instance()->log_info("Skill vacio - delete skill");
	}
}

void ApiJsonController::get_skill(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
	response["data"] = service.get_data(name, "skills");
}

void ApiJsonController::add_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
	if (!new_job.empty()) {
		UserHandler::get_instance().add_user_job(user_logged_id, new_job);
		response["data"]["status"] = "OK";
		response["data"]["message"] = "Job position agregado";
	} else {
		Log::get_instance()->log_info("Job vacio - add job");
	}
}

void ApiJsonController::delete_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
		response["data"]["status"] = "OK";
		response["data"]["message"] = "Job position eliminado";
	} else {
		Log::get_instance()->log_info("Job vacio - delete job");
	}
}

void ApiJsonController::get_job_position(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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
	response["data"] = service.get_data(name, "job_positions");
}

void ApiJsonController::send_message(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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

	Token_FCM token = TokenFCMHandler::get_instance().read_token(receiver_id);
	Notificator notificator(token, TYPE_NOTIFICATOR::CHAT, "Usted ha recibido un mensaje nuevo");
	notificator.send();

	response["data"]["status"] = "OK";
	response["data"]["message"] = "Mensaje enviado exitosamente";
}

void ApiJsonController::view_messages(Mongoose::Request &request, Mongoose::JsonResponse &response) {
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

	// response["data"]["status"] = "OK";
	// response["data"]["messages"] = Json::Value(Json::arrayValue);
	response["data"] = Json::Value(Json::arrayValue);

	for (std::list<Message>::iterator it = messages.begin(); it != messages.end(); ++it) {
		// response["data"]["messages"].append((*it).serialize());
		response["data"].append((*it).serialize());
	}
}

void ApiJsonController::location(Mongoose::Request &request, Mongoose::JsonResponse &response) {
	response["errors"] = Json::Value(Json::arrayValue);
	if (!is_user_logged(request)) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Usuario no autorizado para realizar accion";
		response["errors"].append(errors);
		Log::get_instance()->log_info("Usuario no autorizado - location");
		return;
	}
	std::string user_logged_id = user_tokens_[request.get("token", "")];
	std::string latitude = request.get("latitude", "");
	std::string longitude = request.get("longitude", "");
	if (latitude.empty() || longitude.empty() ) {
		Json::Value errors;
		errors["status"] = "ERROR";
		errors["message"] = "Latitud o longitud vacios";
		//response.setCode(HTTP_CODE_BAD_REQUEST);
		response["errors"].append(errors);
		Log::get_instance()->log_info("Latitud o longitud vacios - location");
		return;
	}
	UserHandler::get_instance().update_user_location(user_logged_id, latitude, longitude);
	response["data"]["status"] = "OK";
	response["data"]["message"] = "Ubicacion de usuario actualizada";
}
