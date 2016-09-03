#ifndef APP_SERVER_APIJSONCONTROLLER_H
#define APP_SERVER_APIJSONCONTROLLER_H

#include <mongoose/JsonController.h>

class ApiJsonController : public Mongoose::JsonController {
	public:
		ApiJsonController();
		~ApiJsonController();
		virtual void setup();
		void hello(Mongoose::Request &request, Mongoose::JsonResponse &response);
};


#endif /* APP_SERVER_APIJSONCONTROLLER_H */