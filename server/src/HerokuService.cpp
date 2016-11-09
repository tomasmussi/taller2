#include "HerokuService.h"

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

Json::Value HerokuService::get_data(std::string name, std::string type) {
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

	Json::Value ans;
	for (unsigned int i = 0; i < root[type].size(); i++) {
		if (root[type][i]["name"].asString().compare(name) == 0) {
			ans["name"] = root[type][i]["name"].asString();
			ans["description"] = root[type][i]["description"].asString();
			ans["category"] = root[type][i]["category"].asString();
			break;
		}
	}
	return ans;
}
