#include "UserList.h"

#include <json/json.h>
#include <sstream>
#include <algorithm>

UserList::UserList(std::string value) : users_() {
	Json::Value root;
	Json::Reader reader;
	reader.parse(value, root);
	for (unsigned int i = 0; i < root["users"].size(); i++) {
		std::string key = root["users"][i].asString();
		users_.push_back(key);
	}
}

bool UserList::add_user(std::string user_id) {
	std::list<std::string>::iterator it = std::find(users_.begin(), users_.end(), user_id);
	if (it == users_.end()) {
		users_.push_back(user_id);
		return true;
	} else {
		return false;
	}
}

size_t UserList::users_size() {
	return users_.size();
}

std::list<std::string> UserList::users() {
	return std::list<std::string>(users_);
}

bool UserList::user_exists(std::string user_id) {
	std::list<std::string>::iterator it = std::find(users_.begin(), users_.end(), user_id);
	return it != users_.end();
}

std::string UserList::database_serialize() {
	Json::Value root;
	root["users"] = Json::Value(Json::arrayValue);
	for (std::list<std::string>::iterator it = users_.begin(); it != users_.end(); ++it) {
		root["users"].append((*it));
	}
	std::ostringstream os;
	os << root;
	return os.str();
}
