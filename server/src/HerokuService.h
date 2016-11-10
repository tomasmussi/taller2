#ifndef APP_SERVER_HEROKUSERVICE_H
#define APP_SERVER_HEROKUSERVICE_H

#include <json/json.h>
#include <mongoose/JsonController.h>
#include <string>

class HerokuService {
private:
	std::string url_;
	std::string service_name_;
public:
	HerokuService(std::string url, std::string service_name);
	~HerokuService();
	void overload_response(Mongoose::JsonResponse &response);
	Json::Value get_data(std::string name, std::string type);
};


#endif /* APP_SERVER_HEROKUSERVICE_H */
