#ifndef APP_SERVER_USERHANDLER_H
#define APP_SERVER_USERHANDLER_H

#include <leveldb/db.h>
#include <string>
#include <list>

#include "User.h"

class UserHandler {
private:
	/* List with user ids */
	std::list<std::string> users_;
	UserHandler();
	~UserHandler();

	/* Loads existing users from database */
	void load_users();

	/* In singleton, make private to deny making a copy */
	UserHandler(UserHandler const &);
	void operator=(UserHandler const &);

public:

	/* Returns signleton database instance */
	static UserHandler& get_instance();

	bool user_exists(std::string user_name);

	void create_user(std::string fb_id);

	User get_user(std::string user_name);
};


#endif /* APP_SERVER_USERHANDLER_H */
