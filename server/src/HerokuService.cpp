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
	reader.parse(os.str(), response["data"]);
}

#include <iostream>

void HerokuService::get_data() {
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
	Json::Value root;
	reader.parse(os.str(), root);
	std::cout << os.str() << std::endl;

	for (unsigned int i = 0; i < root["skills"].size(); i++) {
		std::cout << root["skills"][i]["name"].asString() << std::endl;
		std::cout << std::endl;
		std::cout << root["skills"][i]["description"].asString() << std::endl;
		std::cout << std::endl;
		std::cout << root["skills"][i]["category"].asString() << std::endl;
		std::cout << std::endl;
	}
}
