#ifndef APP_SERVER_USER_H
#define APP_SERVER_USER_H

#include <string>
#include <list>

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
public:
	User(std::string json_value);
	User();
	~User();

	/* Serialize for sending as JSON */
	std::string serialize(bool include_id = false);

	std::string id();
	std::string get_email();
	std::string get_name();
	std::string get_dob();
	std::string get_city();
	std::string get_summary();
	std::string get_profile_photo();

	void replace_not_null(std::string field, std::string value);

	void send_request(User &other_user);

	int requests();

};


#endif /* APP_SERVER_USER_H */
