#ifndef APP_SERVER_USERHANDLER_H
#define APP_SERVER_USERHANDLER_H

#include <leveldb/db.h>
#include <string>
#include <list>
#include <map>
#include <queue>

#include "Message.h"
#include "User.h"

struct OrderByVotes {
	bool operator() (User const &a, User const &b) {
		return a.votes() < b.votes();
	}
};
typedef std::priority_queue<User, std::vector<User>, OrderByVotes> vote_queue;

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

	void lookup(std::string user_logged_id, std::string query, Json::Value &array);

	void send_request(std::string from_user, std::string to_user);

	void answer_request(std::string from_user, std::string to_user, bool accept);

	void load_friends(std::string user_id, Json::Value &array);

	void user_vote(std::string from_user, std::string voted_user);

	vote_queue most_popular();

	void add_user_skill(std::string user_logged_id, std::string new_skill);

	void delete_user_skill(std::string user_logged_id, std::string new_skill);

	void add_user_job(std::string user_logged_id, std::string new_job);

	void delete_user_job(std::string user_logged_id, std::string new_job);

	void send_message(std::string sender_id, std::string receiver_id, std::string message);

	std::list<Message> view_messages(std::string sender_id, std::string receiver_id, std::string limit);
};


#endif /* APP_SERVER_USERHANDLER_H */
