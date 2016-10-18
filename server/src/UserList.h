#ifndef APP_SERVER_USERLIST_H
#define APP_SERVER_USERLIST_H

#include <string>
#include <list>

class UserList {
private:
	std::list<std::string> users_;
public:
	UserList(std::string json_value);

	/* Add user when created if it does not exist */
	bool add_user(std::string user_id);

	/* Size of users in list */
	size_t users_size();

	/* Checks if user exists in database */
	bool user_exists(std::string user_id);

	/* Serialize to save in database */
	std::string database_serialize();

	/* Return a copy of users */
	std::list<std::string> users();
};


#endif /* APP_SERVER_USERLIST_H */
