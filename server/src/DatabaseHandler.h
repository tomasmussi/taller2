#ifndef APP_SERVER_DATABASEBHANDLER_H
#define APP_SERVER_DATABASEBHANDLER_H

#include <leveldb/db.h>
#include <string>

class DatabaseHandler {
private:
	std::string database_name_;
	leveldb::DB *database_;
	leveldb::Options options_;

	DatabaseHandler();
	~DatabaseHandler();

	/* In singleton, make private to deny making a copy */
	DatabaseHandler(DatabaseHandler const &);
	void operator=(DatabaseHandler const &);

public:

	/* Returns signleton database instance */
	static DatabaseHandler& get_instance();

	/* Read key from database */
	std::string read(std::string key);

	/* Write key to database */
	void write(std::string key, std::string value);

	/* Delete key from database */
	void delete_key(std::string key);

};


#endif /* APP_SERVER_DATABASEBHANDLER_H */
