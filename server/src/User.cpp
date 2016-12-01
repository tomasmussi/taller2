#include "User.h"

#include <string>
#include <sstream>
#include <algorithm>
#include <math.h>

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

	load_list(root, "job_positions", job_positions_);
	load_list(root, "friends", friends_);
	load_list(root, "skills", skills_);
	load_list(root, "requests", requests_);

	for (unsigned int i = 0; i < root["user"]["votes"].size(); i++) {
		votes_[(root["user"]["votes"][i].asString())] = 1;
	}

	latitude_ = root["user"]["latitude"].asString();
	longitude_ = root["user"]["longitude"].asString();
}

User::User() {
}

User::~User() {
}



void User::load_list(Json::Value &root, std::string param_name, std::list<std::string> &list) {
	for (unsigned int i = 0; i < root["user"][param_name].size(); i++) {
		list.push_back(root["user"][param_name][i].asString());
	}
}

std::string User::serialize() {
	Json::Value root;
	root["contacts"] = friends_.size();
	root["email"] = email_;
	root["name"] = name_;
	root["dob"] = dob_;
	root["city"] = city_;
	root["summary"] = summary_;
	root["profile_photo"] = profile_photo_;
	serialize_list(root, "requests", requests_);
	serialize_list(root, "skills", skills_);
	serialize_list(root, "job_positions", job_positions_);
	std::ostringstream os;
	os << root;
	return os.str();
}

void User::serialize_list(Json::Value &root, std::string param_name, std::list<std::string> &list) {
	root["user"][param_name] = Json::Value(Json::arrayValue);
	for (std::list<std::string>::iterator it = list.begin(); it != list.end(); ++it) {
		root[param_name].append(*it);
	}
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
	database_serialize_list(root, "requests", requests_);
	database_serialize_list(root, "friends", friends_);
	database_serialize_list(root, "skills", skills_);
	database_serialize_list(root, "job_positions", job_positions_);
	root["user"]["votes"] = Json::Value(Json::arrayValue);
	for (std::map<std::string, int>::iterator it = votes_.begin(); it != votes_.end(); ++it) {
		root["user"]["votes"].append(it->first);
	}
	root["user"]["latitude"] = latitude_;
	root["user"]["longitude"] = longitude_;
	std::ostringstream os;
	os << root;
	return os.str();
}

void User::database_serialize_list(Json::Value &root, std::string param_name, std::list<std::string> &list) {
	root["user"][param_name] = Json::Value(Json::arrayValue);
	for (std::list<std::string>::iterator it = list.begin(); it != list.end(); ++it) {
		root["user"][param_name].append(*it);
	}
}

std::string User::id() const {
	return id_;
}

std::string User::get_email() const {
	return email_;
}

std::string User::get_name() const {
	return name_;
}

std::string User::get_dob() const {
	return dob_;
}
std::string User::get_city() const {
	return city_;
}
std::string User::get_summary() const {
	return summary_;
}
std::string User::get_profile_photo() const {
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

bool User::request_sent(const User &other_user) {
	return std::find(other_user.requests_.begin(), other_user.requests_.end(), id_) != other_user.requests_.end();
}

void User::send_request(User &other_user) {
	// requests_.push_back(other_user.id_);
	if (!request_sent(other_user)) {
		other_user.requests_.push_back(this->id_);
	}
}

int User::requests() {
	return requests_.size();
}

std::list<std::string> User::requests_list() const {
	return requests_;
}

void User::accept_request(User &other_user) {
	requests_.remove(other_user.id_);
	friends_.push_back(other_user.id_);
	other_user.friends_.push_back(id_);
}

void User::reject_request(User &other_user) {
	requests_.remove(other_user.id_);
}

std::list<std::string> User::friends() {
	return friends_;
}

bool User::is_friend(const User &other_user) {
	return std::find(friends_.begin(), friends_.end(), other_user.id()) != friends_.end();
}

bool User::is_friend_request_sent(const User &other_user) {
	return std::find(requests_.begin(), requests_.end(), other_user.id()) != requests_.end();
}

bool User::vote_for(User &other_user) {
	if (other_user.id().compare(id()) == 0) {
		// Cant vote for myself
		return false;
	}
	if (std::find(friends_.begin(), friends_.end(), other_user.id()) == friends_.end()) {
		// Users are not friends. Cant vote for them
		return false;
	}
	other_user.votes_[id()] = 1;
	return true;
}

size_t User::votes() const {
	return votes_.size();
}

bool User::was_voted_by(const User &other_user) {
	return votes_.find(other_user.id()) != votes_.end();
}

bool User::has_skill(std::string skill) {
	return (std::find(skills_.begin(), skills_.end(), skill) != skills_.end());
}

void User::add_skill(std::string new_skill) {
	if (! has_skill(new_skill)) {
		skills_.push_back(new_skill);
	}
}

void User::delete_skill(std::string skill) {
	if (has_skill(skill)) {
		skills_.erase(std::find(skills_.begin(), skills_.end(), skill));
	}
}

bool User::has_job_position(std::string job) {
	return (std::find(job_positions_.begin(), job_positions_.end(), job) != job_positions_.end());
}

void User::add_job_position(std::string new_job) {
	if (! has_job_position(new_job)) {
		job_positions_.push_back(new_job);
	}
}

void User::delete_job_position(std::string job) {
	if (has_job_position(job)) {
		job_positions_.erase(std::find(job_positions_.begin(), job_positions_.end(), job));
	}
}

void User::set_location(std::string latitude, std::string longitude) {
	latitude_ = latitude;
	longitude_ = longitude;
}

std::string User::get_latitude() const {
	return latitude_;
}

std::string User::get_longitude() const {
	return longitude_;
}

/* Approximate Equirectangular -- works if (lat1,lon1) ~ (lat2,lon2)
got from:
http://stackoverflow.com/questions/2741403/get-the-distance-between-two-geo-points
*/
std::string User::distance_to(const User &other) {
	double lat1 = atof(latitude_.c_str());
	double lat2 = atof(other.get_latitude().c_str());
	double lon1 = atof(longitude_.c_str());
	double lon2 = atof(other.get_longitude().c_str());

	int R = 6371; // km
	double x = (lon2 - lon1) * cos((lat1 + lat2) / 2);
	double y = (lat2 - lat1);
	double distance = sqrt(x * x + y * y) * R;
	return std::to_string(distance / 100); // Return distance in km
}
