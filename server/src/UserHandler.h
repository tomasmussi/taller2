#ifndef APP_SERVER_USERHANDLER_H
#define APP_SERVER_USERHANDLER_H

#include <leveldb/db.h>
#include <string>
#include <list>
#include <map>

#include "User.h"

class UserHandler {
private:
	UserHandler();
	~UserHandler();

	/* In singleton, make private to deny making a copy */
	UserHandler(UserHandler const &);
	void operator=(UserHandler const &);

public:

	/* Returns signleton database instance */
	static UserHandler& get_instance();

	bool user_exists(std::string user_name);

	void create_user(std::string fb_id);

	User get_user(std::string user_name);

	void save_user(User &user);

	std::map<std::string, std::string> lookup(std::string query);

	void send_request(std::string from_user, std::string to_user);

	void answer_request(std::string from_user, std::string to_user, bool accept);

	std::map<std::string, std::string> get_friends(std::string user_id);

	void user_vote(std::string from_user, std::string voted_user);
};


#endif /* APP_SERVER_USERHANDLER_H */
