#include "HerokuService.h"

#include <json/json.h>

#include <curlpp/cURLpp.hpp>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>

#include <iostream>
#include <sstream>

HerokuService::HerokuService(std::string url, std::string service_name) 
	: url_(url), service_name_(service_name) {
}

HerokuService::~HerokuService() {
}


void HerokuService::overload_response(Mongoose::JsonResponse &response) {
	curlpp::options::Url myUrl(url_ + "/" + service_name_);
	curlpp::Easy myRequest;
	myRequest.setOpt(myUrl);

	myRequest.perform();

	std::ostringstream os;
	curlpp::options::WriteStream ws(&os);
	myRequest.setOpt(ws);
	myRequest.perform();

	os << myRequest;
	Json::Reader reader;
	reader.parse(os.str(), response);
}
