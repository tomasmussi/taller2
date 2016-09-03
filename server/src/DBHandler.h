#ifndef APP_SERVER_DBHANDLER_H
#define APP_SERVER_DBHANDLER_H

#include <leveldb/db.h>


class DBHandler {
private:
	std::string database_name_;
	leveldb::DB *database_;
	leveldb::Options options_;
public:
	DBHandler(std::string database_name);
	~DBHandler();
	void test_read();
	void test_write();
};


#endif /* APP_SERVER_DBHANDLER_H */