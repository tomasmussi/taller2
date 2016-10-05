#ifndef APP_SERVER_USER_H
#define APP_SERVER_USER_H

#include <string>

class User {
private:
	std::string email_;
	std::string name_;
	std::string dob_;
	std::string city_;
	std::string summary_;
	std::string profile_photo_;
public:
	User();
	User(std::string json_value);
	~User();

	std::string get_email();
	std::string get_name();
	std::string get_dob();
	std::string get_city();
	std::string get_summary();
	std::string get_profile_photo();
};


#endif /* APP_SERVER_USER_H */
