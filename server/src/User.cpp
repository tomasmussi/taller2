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
		"contacts":4,
		"profile_photo":"QURQIEdtYkgK...dHVuZw=="
	}
	}
 */
User::User(std::string json_value) {
	Json::Value root;
	Json::Reader reader;
	reader.parse(json_value, root);
	email_ = root["user"]["email"].asString();
	name_ = root["user"]["name"].asString();
	dob_ = root["user"]["dob"].asString();
	city_ = root["user"]["city"].asString();
	summary_ = root["user"]["summary"].asString();
	profile_photo_ = root["user"]["profile_photo"].asString();
}

User::User() {
}

User::~User() {
}

std::string User::serialize() {
	Json::Value root;
	root["user"]["email"] = email_;
	root["user"]["name"] = name_;
	root["user"]["dob"] = dob_;
	root["user"]["city"] = city_;
	root["user"]["summary"] = summary_;
	root["user"]["profile_photo"] = profile_photo_;
	std::ostringstream os;
	os << root;
	return os.str();
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

