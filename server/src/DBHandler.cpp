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

void DBHandler::write(std::string key, std::string value){
	leveldb::Status status = database_->Put(leveldb::WriteOptions(), key, value);
}

std::string DBHandler::read(std::string key){
	std::string value;
	database_->Get(leveldb::ReadOptions(), key, &value);
	return value;
}

void DBHandler::delete_key(std::string key) {
	database_->Delete(leveldb::WriteOptions(), key);
}

