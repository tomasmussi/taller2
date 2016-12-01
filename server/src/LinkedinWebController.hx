#ifndef APP_SERVER_LINKEDINWEBCONTROLLER_H
#define APP_SERVER_LINKEDINWEBCONTROLLER_H

#include <mongoose/WebController.h>

class LinkedinWebController : public Mongoose::WebController {
private:
public:
	LinkedinWebController();
	~LinkedinWebController();

	virtual void setup();

	void hello(Mongoose::Request &request, Mongoose::StreamResponse &response);
	void form(Mongoose::Request &request, Mongoose::StreamResponse &response);
	void formPost(Mongoose::Request &request, Mongoose::StreamResponse &response);
	void session(Mongoose::Request &request, Mongoose::StreamResponse &response);
	void forbid(Mongoose::Request &request, Mongoose::StreamResponse &response);
	void exception(Mongoose::Request &request, Mongoose::StreamResponse &response);
	void uploadForm(Mongoose::Request &request, Mongoose::StreamResponse &response);
	void upload(Mongoose::Request &request, Mongoose::StreamResponse &response);
};


#endif /* APP_SERVER_LINKEDINWEBCONTROLLER_H */