#include "LinkedinWebController.h"

LinkedinWebController::LinkedinWebController() {

}

LinkedinWebController::~LinkedinWebController() {

}

void LinkedinWebController::hello(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	response << "Hello " << htmlEntities(request.get("name", "... what's your name ?")) << endl;
}

void LinkedinWebController::form(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	(void) request;
	response << "<form method=\"post\">" << endl;
	response << "<input type=\"text\" name=\"test\" /><br >" << endl;
	response << "<input type=\"submit\" value=\"Envoyer\" />" << endl;
	response << "</form>" << endl;
}

void LinkedinWebController::formPost(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	response << "Test=" << htmlEntities(request.get("test", "(unknown)"));
}

void LinkedinWebController::session(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	Mongoose::Session &session = getSession(request, response);
	if (session.hasValue("try")) {
		response << "Session value: " << session.get("try");
	} else {
		ostringstream val;
		val << time(NULL);
		session.setValue("try", val.str());
		response << "Session value set to: " << session.get("try");
	}
}

void LinkedinWebController::forbid(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	(void) request;
	response.setCode(HTTP_FORBIDDEN);
	response << "403 forbidden demo";
}

void LinkedinWebController::exception(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	(void) request;
	(void) response;
	throw string("Exception example");
}

void LinkedinWebController::uploadForm(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	(void) request;
	response << "<h1>File upload demo (don't forget to create a tmp/ directory)</h1>";
	response << "<form enctype=\"multipart/form-data\" method=\"post\">";
	response << "Choose a file to upload: <input name=\"file\" type=\"file\" /><br />";
	response << "<input type=\"submit\" value=\"Upload File\" />";
	response << "</form>";
}

void LinkedinWebController::upload(Mongoose::Request &request, Mongoose::StreamResponse &response) {
	request.handleUploads();

	// Iterate through all the uploaded files
	std::vector<Mongoose::UploadFile>::iterator it = request.uploadFiles.begin();
	for (; it != request.uploadFiles.end(); it++) {
		Mongoose::UploadFile file = *it;
		file.saveTo("tmp/");
		response << "Uploaded file: " << file.getName() << endl;
	}
}

void LinkedinWebController::setup() {
	// Hello demo
	registerRoute("GET", "/hello",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::hello ));

	registerRoute("GET", "/",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::hello ));

	// Form demo
	registerRoute("GET", "/form",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::form ));
	registerRoute("POST", "/form",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::formPost ));

	// Session demo
	registerRoute("GET", "/session",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::session ));

	// Exception example
	registerRoute("GET", "/exception",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::exception ));

	// 403 demo
	registerRoute("GET", "/403",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::forbid ));

	// File upload demo
	registerRoute("GET", "/upload",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::uploadForm ));
	registerRoute("POST", "/upload",
		new Mongoose::RequestHandler<LinkedinWebController, Mongoose::StreamResponse>(this, &LinkedinWebController::upload ));
}
