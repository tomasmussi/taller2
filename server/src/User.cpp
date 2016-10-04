#include "User.h"

#include <json/json.h>

User::User() {
}

User::User(std::string json_value) {
	Json::Value root;
	Json::Reader reader;
	reader.parse(json_value, root);
}

User::~User() {
}


std::string User::get_email() {
	return email_;
}
