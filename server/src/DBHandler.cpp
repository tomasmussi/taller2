#include "DBHandler.h"

#include <iostream>

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