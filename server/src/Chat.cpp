#include "Chat.h"

#include <json/json.h>
#include <sstream>
#include <algorithm>

Chat::Chat(std::string value) : messages_() {
	Json::Value root;
	Json::Reader reader;
	reader.parse(value, root);
	for (unsigned int i = 0; i < root["messages"].size(); i++) {
		std::string key = root["messages"][i].asString();
		messages_.push_back(Message(key));
	}
}

std::string Chat::database_serialize() {
	Json::Value root;
	root["messages"] = Json::Value(Json::arrayValue);
	for (std::list<Message>::iterator it = messages_.begin(); it != messages_.end(); ++it) {
		root["users"].append((*it).database_serialize());
	}
	std::ostringstream os;
	os << root;
	return os.str();
}


void Chat::add_message(std::string sender_id, std::string receiver_id, std::string message) {
	Message m(sender_id, receiver_id, message);
}