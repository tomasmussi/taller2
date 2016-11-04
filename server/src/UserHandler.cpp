#include "DatabaseHandler.h"
#include "UserHandler.h"

#include "UserList.h"

#include <json/json.h>

#include <iostream>
#include <sstream>
#include <string>

UserHandler::UserHandler() {
}

UserHandler::~UserHandler() {
}

UserHandler& UserHandler::get_instance() {
	static UserHandler instance;
	return instance;
}

bool UserHandler::user_exists(std::string user_name) {
	UserList list(DatabaseHandler::get_instance().read("users"));
	return list.user_exists(user_name);
}

void UserHandler::create_user(std::string fb_id) {
	Json::Value root;
	root["user"]["fb_id"] = fb_id;
	std::ostringstream os;
	os << root;
	DatabaseHandler::get_instance().write("user-" + fb_id, os.str());

	std::string value = DatabaseHandler::get_instance().read("users");
	UserList list(value);
	if (list.add_user(fb_id)) {
		DatabaseHandler::get_instance().write("users", list.database_serialize());
	}
}

User UserHandler::get_user(std::string user_name) {
	std::string user_data_json = DatabaseHandler::get_instance().read("user-" + user_name);
	return User(user_data_json);
}

void UserHandler::save_user(User &user) {
	DatabaseHandler::get_instance().write("user-" + user.id(), user.database_serialize());
}

std::map<std::string, std::string> UserHandler::lookup(std::string query) {
	std::map<std::string, std::string> answer;

	/* Por ahora es match directo contra el nombre */
	std::string value = DatabaseHandler::get_instance().read("users");
	std::list<std::string> users = UserList(value).users();
	for (std::list<std::string>::iterator it = users.begin(); it != users.end(); ++it) {
		// Users is a list of ids, need user to compare to name
		// TODO(tomas) Delete couts
		std::cout << "user: " << (*it) << std::endl;
		User user = get_user((*it));
		std::cout << "nombre: " << user.id() << "\t" << user.get_name() << std::endl;
		if (user.get_name().compare(query) == 0) {
			User user = get_user((*it));
			answer[user.id()] = user.get_name();
		}
	}
	return answer;
}

void UserHandler::send_request(std::string from_user, std::string to_user) {
	User user_from = get_user(from_user);
	User user_to = get_user(to_user);
	user_from.send_request(user_to);
	save_user(user_from);
	save_user(user_to);
}

void UserHandler::answer_request(std::string from_user, std::string to_user, bool accept) {
	User user_from = get_user(from_user);
	User user_to = get_user(to_user);
	if (accept) {
		user_from.accept_request(user_to);
	} else {
		user_from.reject_request(user_to);
	}
	save_user(user_from);
	save_user(user_to);
}

std::map<std::string, std::string> UserHandler::get_friends(std::string user_id) {
	std::map<std::string, std::string> answer;
	User user = get_user(user_id);
	std::list<std::string> friends = user.friends();
	for (std::list<std::string>::iterator it = friends.begin(); it != friends.end(); ++it) {
		User user = get_user((*it));
		answer[user.id()] = user.get_name();
	}
	return answer;
}


void UserHandler::user_vote(std::string from_user, std::string voted_user_id) {
	User user_from = get_user(from_user);
	User voted_user = get_user(voted_user_id);
	user_from.vote_for(voted_user);
	save_user(user_from);
	save_user(voted_user);
}

/* WARNING! Este metodo tiene dependencias de todos lados. Testear profundamente */
vote_queue UserHandler::most_popular() {
	UserList list(DatabaseHandler::get_instance().read("users"));
	std::list<std::string> users = list.users();
	vote_queue answer;
	for (std::list<std::string>::iterator it = users.begin(); it != users.end(); ++it) {
		User user = get_user((*it));
		answer.push(user);
	}
	return answer;
}

void UserHandler::add_user_skill(std::string user_logged_id, std::string new_skill) {
	User user = get_user(user_logged_id);
	user.add_skill(new_skill);
	save_user(user);
}

void UserHandler::delete_user_skill(std::string user_logged_id, std::string new_skill) {
	User user = get_user(user_logged_id);
	user.delete_skill(new_skill);
	save_user(user);
}

void UserHandler::add_user_job(std::string user_logged_id, std::string new_job) {
	User user = get_user(user_logged_id);
	user.add_job_position(new_job);
	save_user(user);
}

void UserHandler::delete_user_job(std::string user_logged_id, std::string new_job) {
	User user = get_user(user_logged_id);
	user.delete_job_position(new_job);
	save_user(user);
}
