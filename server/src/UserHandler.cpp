#include "DatabaseHandler.h"
#include "UserHandler.h"

#include <json/json.h>

#include <iostream>
#include <sstream>
#include <string>

UserHandler::UserHandler() : users_() {
	load_users();
}

UserHandler::~UserHandler() {
}

void UserHandler::load_users() {
	users_.clear();
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

void UserHandler::create_user(std::string fb_id) {
	users_.push_back(fb_id);
	Json::Value root;
	root["user"]["fb_id"] = fb_id;
	std::ostringstream os;
	os << root;
	DatabaseHandler::get_instance().write("user-" + fb_id, os.str());
}

User UserHandler::get_user(std::string user_name) {
	std::string user_data_json = DatabaseHandler::get_instance().read("user-" + user_name);
	return User(user_data_json);
}

void UserHandler::save_user(User &user) {
	DatabaseHandler::get_instance().write("user-" + user.id(), user.database_serialize());
}

void UserHandler::send_request(std::string from_user, std::string to_user) {
	User user_from = get_user(from_user);
	User user_to = get_user(to_user);
	user_from.send_request(user_to);
	save_user(user_from);
	save_user(user_to);
}

void UserHandler::accept_request(std::string from_user, std::string to_user) {
	User user_from = get_user(from_user);
	User user_to = get_user(to_user);
	user_from.accept_request(user_to);
	save_user(user_from);
	save_user(user_to);
}

