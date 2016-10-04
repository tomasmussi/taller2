#ifndef APP_SERVER_USER_H
#define APP_SERVER_USER_H

#include <string>

class User {
private:
	std::string email_;
public:
	User();
	User(std::string json_value);
	~User();

	std::string get_email();
};


#endif /* APP_SERVER_USER_H */
