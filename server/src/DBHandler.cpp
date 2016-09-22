#include "DBHandler.h"

#include <json/json.h>

#include <iostream>
#include <sstream>

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
	std::string key = "padron";
	std::string value = "91985";
	leveldb::Status status = database_->Put(leveldb::WriteOptions(), key, value);
}

void DBHandler::write(std::string key, std::string value){
	leveldb::Status status = database_->Put(leveldb::WriteOptions(), key, value);
}

std::string DBHandler::read(std::string key){
	std::string value;
	leveldb::Status status = database_->Get(leveldb::ReadOptions(), key, &value);
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
	}
	std::cout << users << std::endl;
	return true;
}
