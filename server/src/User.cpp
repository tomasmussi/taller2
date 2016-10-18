#include "User.h"

#include <json/json.h>
#include <string>
#include <sstream>

/* Construct User from string parsed as JSON
 * JSON format is:
 * {
	"user":{
		"name":"Tomas Mussi",
		"email":"tomasmussi@gmail.com",
		"pass":"tomas",
		"dob":"11/07/1991",
		"city":"Ciudad de Buenos Aires",
		"summary":"Estudiante de ingenieria informatica de la UBA.",
		"skills":[
			1,
			2
		],
		"requests" : [
			"fb_id_1",
			"fb_id_2"
		],
		"contacts":4,
		"profile_photo":"QURQIEdtYkgK...dHVuZw=="
	}
	}
 */
User::User(std::string json_value) : requests_(), friends_() {
	Json::Value root;
	Json::Reader reader;
	reader.parse(json_value, root);
	id_ = root["user"]["fb_id"].asString();
	email_ = root["user"]["email"].asString();
	name_ = root["user"]["name"].asString();
	dob_ = root["user"]["dob"].asString();
	city_ = root["user"]["city"].asString();
	summary_ = root["user"]["summary"].asString();
	profile_photo_ = root["user"]["profile_photo"].asString();
	for (unsigned int i = 0; i < root["user"]["requests"].size(); i++) {
		requests_.push_back(root["user"]["requests"][i].asString());
	}
}

User::User() {
}

User::~User() {
}

std::string User::serialize() {
	Json::Value root;
	root["user"]["contacts"] = friends_.size();
	root["user"]["email"] = email_;
	root["user"]["name"] = name_;
	root["user"]["dob"] = dob_;
	root["user"]["city"] = city_;
	root["user"]["summary"] = summary_;
	root["user"]["profile_photo"] = profile_photo_;
	unsigned int count = 0;
	for (std::list<std::string>::iterator it = requests_.begin(); it != requests_.end(); ++it) {
		root["user"]["requests"][count++] = (*it);
	}
	std::ostringstream os;
	os << root;
	return os.str();
}

std::string User::database_serialize() {
	Json::Value root;
	root["user"]["fb_id"] = id_;
	root["user"]["email"] = email_;
	root["user"]["name"] = name_;
	root["user"]["dob"] = dob_;
	root["user"]["city"] = city_;
	root["user"]["summary"] = summary_;
	root["user"]["profile_photo"] = profile_photo_;
	root["user"]["requests"] = Json::Value(Json::arrayValue);
	for (std::list<std::string>::iterator it = requests_.begin(); it != requests_.end(); ++it) {
		root["user"]["requests"].append(*it);
	}
	root["user"]["friends"] = Json::Value(Json::arrayValue);
	for (std::list<std::string>::iterator it = friends_.begin(); it != friends_.end(); ++it) {
		root["user"]["friends"].append(*it);
	}
	std::ostringstream os;
	os << root;
	return os.str();
}

std::string User::id() {
	return id_;
}

std::string User::get_email() {
	return email_;
}

std::string User::get_name() {
	return name_;
}

std::string User::get_dob() {
	return dob_;
}
std::string User::get_city() {
	return city_;
}
std::string User::get_summary() {
	return summary_;
}
std::string User::get_profile_photo() {
	return profile_photo_;
}

void User::replace_not_null(std::string field, std::string value) {
	if (value.compare("empty") == 0) {
		return;
	}
	if (field.compare("name") == 0) {
		name_ = value;
	}
	if (field.compare("email") == 0) {
		email_ = value;
	}
	if (field.compare("dob") == 0) {
		dob_ = value;
	}
	if (field.compare("city") == 0) {
		city_ = value;
	}
	if (field.compare("summary") == 0) {
		summary_ = value;
	}
	if (field.compare("profile_photo") == 0) {
		profile_photo_ = value;
	}
}

void User::send_request(User &other_user) {
	// requests_.push_back(other_user.id_);
	other_user.requests_.push_back(this->id_);
}

int User::requests() {
	return requests_.size();
}

void User::accept_request(User &other_user) {
	requests_.remove(other_user.id_);
	friends_.push_back(other_user.id_);
	other_user.friends_.push_back(id_);
}

