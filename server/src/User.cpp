#include "User.h"

#include <json/json.h>
#include <string>

User::User() {
}

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

User::~User() {
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

