#ifndef APP_SERVER_USER_H
#define APP_SERVER_USER_H

#include <string>
#include <list>
#include <map>

class User {
private:
	std::string id_;
	std::string email_;
	std::string name_;
	std::string dob_;
	std::string city_;
	std::string summary_;
	std::string profile_photo_;

	std::list<std::string> requests_;
	std::list<std::string> friends_;
	std::map<std::string, int> votes_;
public:
	User(std::string json_value);
	User();
	~User();

	/* Serialize for sending as JSON */
	std::string serialize();
	std::string database_serialize();

	std::string id() const;
	std::string get_email();
	std::string get_name();
	std::string get_dob();
	std::string get_city();
	std::string get_summary();
	std::string get_profile_photo();

	void replace_not_null(std::string field, std::string value);

	/* Send a request to add contact to my contacts */
	void send_request(User &other_user);

	int requests();

	/* Accept another user request */
	void accept_request(User &other_user);

	/* Reject another user request */
	void reject_request(User &other_user);

	std::list<std::string> friends();

	void vote_for(User &other_user);

	size_t votes() const;

	bool was_voted_by(const User &other_user);

};


#endif /* APP_SERVER_USER_H */
