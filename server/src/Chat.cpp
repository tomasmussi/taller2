#include "Chat.h"

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
}

std::string Chat::database_serialize() {
	Json::Value root;
	root["messages"] = Json::Value(Json::arrayValue);
	for (std::list<Message>::iterator it = messages_.begin(); it != messages_.end(); ++it) {
		root["messages"].append((*it).database_serialize());
	}
	std::ostringstream os;
	os << root;
	return os.str();
}


void Chat::add_message(std::string sender_id, std::string receiver_id, std::string message) {
	Message m(sender_id, receiver_id, message);
	messages_.push_back(m);
	messages_.sort(PComp<Message>);
}


