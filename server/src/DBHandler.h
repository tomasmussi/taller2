#ifndef APP_SERVER_DBHANDLER_H
#define APP_SERVER_DBHANDLER_H

#include <leveldb/db.h>
#include <string>

class DBHandler {
private:
	std::string database_name_;
	leveldb::DB *database_;
	leveldb::Options options_;
public:
	DBHandler(std::string database_name);
	~DBHandler();
	std::string read(std::string key);
	void write(std::string key, std::string value);
	void delete_key(std::string key);
	void test_read();
	void test_write();
	std::string get_value(std::string key);
	bool login(std::string user, std::string pass);
};


#endif /* APP_SERVER_DBHANDLER_H */
