#include "DatabaseHandler.h"
#include "UserHandler.h"

#include <json/json.h>

#include <iostream>
#include <string>

UserHandler::UserHandler() : users_() {
	load_users();
}

UserHandler::~UserHandler() {
}

void UserHandler::load_users() {
	std::string value = DatabaseHandler::get_instance().read("users");
	Json::Value root;
	Json::Reader reader;
	reader.parse(value, root);
	for (unsigned int i = 0; i < root["users"].size(); i++) {
		std::string key = root["users"][i].asString();
		users_.push_back(key);
	}
}

UserHandler& UserHandler::get_instance() {
	static UserHandler instance;
	return instance;
}

bool UserHandler::user_exists(std::string user_name) {
	std::string user_data_json = DatabaseHandler::get_instance().read("user-" + user_name);
	return !user_data_json.empty();
}

User UserHandler::get_user(std::string user_name) {
	std::string user_data_json = DatabaseHandler::get_instance().read("user-" + user_name);
	return User(user_data_json);
}
