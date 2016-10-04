#include "DatabaseHandler.h"
#include <iostream>


DatabaseHandler::DatabaseHandler() :
		database_name_("testdb"), database_(NULL), options_() {

	std::cout << "construyendo singleton handler" << std::endl;
	options_.create_if_missing = true;
	leveldb::Status status = leveldb::DB::Open(options_, database_name_, &database_);
}

DatabaseHandler::~DatabaseHandler() {
	std::cout << "destruyendo database handler" << std::endl;
	delete database_;
}

DatabaseHandler& DatabaseHandler::get_instance() {
	static DatabaseHandler instance;
	return instance;
}


void DatabaseHandler::write(std::string key, std::string value){
	leveldb::Status status = database_->Put(leveldb::WriteOptions(), key, value);
}

std::string DatabaseHandler::read(std::string key){
	std::string value;
	database_->Get(leveldb::ReadOptions(), key, &value);
	return value;
}

void DatabaseHandler::delete_key(std::string key) {
	database_->Delete(leveldb::WriteOptions(), key);
}

