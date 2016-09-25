#include "DBHandler.h"

#include <json/json.h>

#include <iostream>
#include <sstream>
#include <string> 

DBHandler::DBHandler(std::string database_name) : database_name_(database_name),
	database_(NULL),
	options_() {

	options_.create_if_missing = true;
	leveldb::Status status = leveldb::DB::Open(options_, database_name_, &database_);
}

DBHandler::~DBHandler() {
	delete database_;
}

void DBHandler::test_write() {
	/*std::string key = "padron";
	std::string value = "91985";
	leveldb::Status status = database_->Put(leveldb::WriteOptions(), key, value);*/

	std::string key = "users";
	Json::Value root;   // 'root' will contain the root value after parsing.
	root["0"]["user"] = "tomas";
	root["0"]["pass"] = "tomas";
	root["1"]["user"] = "alfredo";
	root["1"]["pass"] = "alfredo";
	std::ostringstream os;
	os << root;
	std::string value = os.str();
	leveldb::Status status = database_->Put(leveldb::WriteOptions(), key, value);
}

void DBHandler::write(std::string key, std::string value){
	leveldb::Status status = database_->Put(leveldb::WriteOptions(), key, value);
}

std::string DBHandler::read(std::string key){
	key = "users";
	std::string value;
	leveldb::Status status = database_->Get(leveldb::ReadOptions(), key, &value);
	std::cout << value << std::endl;
	return value;
}

void DBHandler::test_read() {
	std::string key = "padron";
	std::string value;
	leveldb::Status status = database_->Get(leveldb::ReadOptions(), key, &value);
}

std::string DBHandler::get_value(std::string key) {
	std::string value;
	leveldb::Status status = database_->Get(leveldb::ReadOptions(), key, &value);
	return value;
}

bool DBHandler::login(std::string user, std::string pass) {
	std::string key = "users";
	std::string users;
	database_->Get(leveldb::ReadOptions(), key, &users);
	if (users.empty()) {
		std::cout << "empty" << std::endl;
		Json::Value root;   // 'root' will contain the root value after parsing.
		root[user]["user"] = user;
		root[user]["pass"] = pass;
		std::ostringstream os;
		os << root;
		std::cout << os.str() << std::endl;
		database_->Put(leveldb::WriteOptions(), key, os.str());
	} else {
		key = "users";
		std::string value;
		leveldb::Status status = database_->Get(leveldb::ReadOptions(), key, &value);
		Json::Value root;
		Json::Reader reader;
		reader.parse(value, root);
		std::cout << root.size() << std::endl;
		for (size_t i = 0; i < root.size(); i++) {
			std::string user_nro = std::to_string(i);
			std::cout << "root sarasa: " << root[user_nro]["user"].asString() << std::endl;
			std::cout << "user: " << user << std::endl;
			if (root[user_nro]["user"].asString().compare(user) == 0) {
				if (root[user_nro]["pass"].compare(pass) == 0) {
					std::cout << root[user_nro]["user"].asString() << " encontrado" << std::endl;
					return true;
				}
			}
		}
	}
	std::cout << users << std::endl;
	return false;
}
