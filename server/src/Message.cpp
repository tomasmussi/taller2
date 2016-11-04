#include "Message.h"

#include <string>
#include <sstream>
#include <algorithm>

Message::Message(std::string json_value) {
	Json::Value root;
	Json::Reader reader;
	reader.parse(json_value, root);
	sender_id_ = root["sender_id_"].asString();
	receiver_id_ = root["receiver_id"].asString();
	message_ = root["message"].asString();
	timestamp_ = root["timestamp"].asString();
}

Message::Message(std::string sender_id,std::string receiver_id, std::string message) {
	sender_id_ = sender_id;
	receiver_id_ = receiver_id;
	message_ = message;
}

Message::Message() {
}

Message::~Message() {
}

std::string Message::serialize() {
	Json::Value root;
	root["sender_id_"] = sender_id_;
	root["receiver_id"] = receiver_id_;
	root["message"] = message_;
	root["timestamp"] = timestamp_;
	std::ostringstream os;
	os << root;
	return os.str();
}

std::string Message::database_serialize() {
	Json::Value root;
	root["sender_id_"] = sender_id_;
	root["receiver_id"] = receiver_id_;
	root["message"] = message_;
	root["timestamp"] = timestamp_;
	std::ostringstream os;
	os << root;
	return os.str();
}

std::string Message::get_sender_id() const {
	return sender_id_;
}

std::string Message::get_receiver_id() {
	return receiver_id_;
}

std::string Message::get_message() {
	return message_;
}

std::string Message::get_timestamp() {
	return timestamp_;
}

