#include "Chat.h"

#include <iostream>

#include <json/json.h>
#include <sstream>
#include <algorithm>

template <typename T> bool PComp(const T & a, const T & b)
{
   return a.get_timestamp() > b.get_timestamp();
}

/*
std::vector<Foo*> myvec;
std::list<Foo*> mylist;
std::sort(myvec.begin(), myvec.end(), PComp<Foo>);
mylist.sort(PComp<Message>);
*/

Chat::Chat(std::string value) : messages_() {
	Json::Value root;
	Json::Reader reader;
	reader.parse(value, root);
	for (unsigned int i = 0; i < root["messages"].size(); i++) {
		std::string key = root["messages"][i].asString();
		messages_.push_back(Message(key));
	}
	std::cout << "en el chat hay " << messages_.size() << " mensajes" << std::endl;
}

std::string Chat::database_serialize() {
	Json::Value root;
	root["messages"] = Json::Value(Json::arrayValue);
	unsigned count = 0;
	for (std::list<Message>::iterator it = messages_.begin(); it != messages_.end(); ++it) {
		root["messages"].append((*it).database_serialize());
		count++;
	}
	std::cout << "se guardan " << count << " mensajes en la bbdd" << std::endl;
	std::ostringstream os;
	os << root;
	return os.str();
}


void Chat::add_message(std::string sender_id, std::string receiver_id, std::string message) {
	Message m(sender_id, receiver_id, message);
	messages_.push_back(m);
	messages_.sort(PComp<Message>);
}

std::list<Message> Chat::view_messages(std::string limit) {
	int int_limit = atoi(limit.c_str());
	std::list<Message> list;
	int count = 0;
	for (std::list<Message>::iterator it = messages_.begin(); it != messages_.end(); ++it) {
		list.push_back(*it);
		count++;
		if (int_limit != 0 && count >= int_limit) {
			break;
		}
	}
	return list;
}

