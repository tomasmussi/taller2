#include "Message.h"


#include <iostream>

#include <string>
#include <sstream>
// #include <algorithm>
#include <ctime>

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
	time_t rawtime;
	struct tm * timeinfo;
	char buffer[80];

	time (&rawtime);
	timeinfo = localtime(&rawtime);

	// strftime(buffer,80,"%d-%m-%Y %I:%M:%S",timeinfo);
	strftime(buffer,80,"%Y-%m-%d %H:%M:%S",timeinfo);
	timestamp_ = std::string(buffer);
	std::cout << "timestamp: " << timestamp_ << std::endl;
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

std::string Message::get_receiver_id() const {
	return receiver_id_;
}

std::string Message::get_message() const {
	return message_;
}

std::string Message::get_timestamp() const {
	return timestamp_;
}

