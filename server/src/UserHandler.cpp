#include "Chat.h"
#include "DatabaseHandler.h"
#include "UserHandler.h"
#include "UserList.h"
#include "log.h"

#include <json/json.h>

#include <sstream>
#include <string>

#include <algorithm>
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

bool UserHandler::lookup_match(const User &u, std::string query) {
	std::string user_name_lower = u.get_name();
	std::transform(user_name_lower.begin(), user_name_lower.end(), user_name_lower.begin(), ::tolower);
	std::string query_lower = std::string(query);
	std::transform(query_lower.begin(), query_lower.end(), query_lower.begin(), ::tolower);
	
	std::size_t position = user_name_lower.find(query_lower);
	bool found = (position != std::string::npos);
	return u.get_name().compare(query) == 0 || u.id().compare(query) == 0 || found;
}

void UserHandler::lookup(std::string user_logged_id, std::string query, Json::Value &array) {
	User me = get_user(user_logged_id);
	/* Por ahora es match directo contra el nombre */
	std::string value = DatabaseHandler::get_instance().read("users");
	std::list<std::string> users = UserList(value).users();
	for (std::list<std::string>::iterator it = users.begin(); it != users.end(); ++it) {
		// Users is a list of ids, need user to compare to name
		User user = get_user((*it));
		if (lookup_match(user, query)) {
			User user = get_user((*it));
			Json::Value user_value;
			user_value["fb_id"] = user.id();
			user_value["name"] = user.get_name();
			user_value["photo"] = user.get_profile_photo();
			user_value["is_contact"] = (me.is_friend(user) ? "true" : "false");
			user_value["distance"] = me.distance_to(user);
			user_value["summary"] = user.get_summary();
			user_value["is_friend_request_sent"] = me.is_friend_request_sent(user);
			array.append(user_value);
		}
	}
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

void UserHandler::get_requests(std::string user_id, Json::Value &array) {
	User user = get_user(user_id);
	std::list<std::string> requests = user.requests_list();
	for (std::list<std::string>::iterator it = requests.begin(); it != requests.end(); ++it) {
		User user_request = get_user((*it));
		Json::Value user_value;
		user_value["fb_id"] = user_request.id();
		user_value["name"] = user_request.get_name();
		user_value["photo"] = user_request.get_profile_photo();
		user_value["is_contact"] = (user.is_friend(user_request) ? "true" : "false");
		user_value["summary"] = user.get_summary();
		array.append(user_value);
	}
}

void UserHandler::load_friends(std::string user_id, Json::Value &array) {
	User user = get_user(user_id);
	std::list<std::string> friends = user.friends();
	for (std::list<std::string>::iterator it = friends.begin(); it != friends.end(); ++it) {
		User user_friend = get_user((*it));
		Json::Value user_value;
		user_value["distance"] = user.distance_to(user_friend);
		user_value["fb_id"] = user_friend.id();
		user_value["name"] = user_friend.get_name();
		user_value["photo"] = user_friend.get_profile_photo();
		user_value["is_contact"] = (user.is_friend(user_friend) ? "true" : "false");
		user_value["summary"] = user.get_summary();
		array.append(user_value);
	}
}

void UserHandler::load_friends_distance(std::string user_id, Json::Value &array) {
	User user = get_user(user_id);
	std::list<std::string> friends = user.friends();
	distance_queue answer;
	for (std::list<std::string>::iterator it = friends.begin(); it != friends.end(); ++it) {
		User user_friend = get_user((*it));
		float distance = atof(user.distance_to(user_friend).c_str());
		user_friend.distance_to_other_user(distance);
		answer.push(user_friend);
	}

	while (!answer.empty()) {
		Json::Value user_value;
		User it = answer.top();
		user_value["distance"] = user.distance_to(it);
		user_value["fb_id"] = it.id();
		user_value["name"] = it.get_name();
		user_value["photo"] = it.get_profile_photo();
		user_value["is_contact"] = (user.is_friend(it) ? "true" : "false");
		user_value["is_friend_request_sent"] = user.is_friend_request_sent(it);
		user_value["summary"] = it.get_summary();
		array.append(user_value);
		answer.pop();
	}
}



bool UserHandler::user_vote(std::string from_user, std::string voted_user_id) {
	User user_from = get_user(from_user);
	User voted_user = get_user(voted_user_id);
	bool success = user_from.vote_for(voted_user);
	save_user(user_from);
	save_user(voted_user);
	return success;
}

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

void UserHandler::send_message(std::string sender_id, std::string receiver_id, std::string message) {
	User sender = get_user(sender_id);
	User receiver = get_user(receiver_id);
	std::string first_attempt = "chat-" + sender.id() + "-" + receiver.id();
	std::string second_attempt = "chat-" + receiver.id() + "-" + sender.id();
	std::string new_key;

	std::string chat = DatabaseHandler::get_instance().read(first_attempt);
	if (chat.empty()) {
		chat = DatabaseHandler::get_instance().read(second_attempt);
		if (chat.empty()) {
			new_key = first_attempt;
		} else {
			new_key = second_attempt;
		}
	} else {
		new_key = first_attempt;
	}
	Chat user_chats(chat);
	user_chats.add_message(sender.id(), receiver.id(), message);
	Log::get_instance()->log_info("Chat: [" + new_key + "]");
	Log::get_instance()->log_info("Chat: [" + user_chats.database_serialize() + "]");
	DatabaseHandler::get_instance().write(new_key, user_chats.database_serialize());
}


std::list<Message> UserHandler::view_messages(std::string sender_id, std::string receiver_id, std::string limit) {
	User sender = get_user(sender_id);
	User receiver = get_user(receiver_id);
	std::string first_attempt = "chat-" + sender.id() + "-" + receiver.id();
	std::string second_attempt = "chat-" + receiver.id() + "-" + sender.id();

	std::string chat = DatabaseHandler::get_instance().read(first_attempt);
	if (chat.empty()) {
		chat = DatabaseHandler::get_instance().read(second_attempt);
	}

	Chat user_chats(chat);
	return user_chats.view_messages(limit);
}

void UserHandler::update_user_location(std::string user_id, std::string latitude, std::string longitude) {
	User user = get_user(user_id);
	user.set_location(latitude, longitude);
	save_user(user);
}

