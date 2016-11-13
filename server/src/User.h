#ifndef APP_SERVER_USER_H
#define APP_SERVER_USER_H

#include <json/json.h>

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

	std::list<std::string> skills_;
	std::list<std::string> job_positions_;
	void serialize_list(Json::Value &root, std::string param_name, std::list<std::string> &list);

	std::string latitude_;
	std::string longitude_;

public:
	User(std::string json_value);
	User();
	~User();

	void load_list(Json::Value &root, std::string param_name, std::list<std::string> &list);

	/* Serialize for sending as JSON */
	std::string serialize();
	std::string database_serialize();

	std::string id() const;
	std::string get_email() const;
	std::string get_name() const;
	std::string get_dob() const;
	std::string get_city() const;
	std::string get_summary() const;
	std::string get_profile_photo() const;

	void replace_not_null(std::string field, std::string value);

	/* Send a request to add contact to my contacts */
	void send_request(User &other_user);

	int requests();

	std::list<std::string> requests_list() const;

	/* Accept another user request */
	void accept_request(User &other_user);

	/* Reject another user request */
	void reject_request(User &other_user);

	std::list<std::string> friends();

	bool is_friend(const User &other_user);

	bool vote_for(User &other_user);

	size_t votes() const;

	bool was_voted_by(const User &other_user);

	void add_skill(std::string new_skill);

	bool has_skill(std::string skill);

	void delete_skill(std::string skill);

	void add_job_position(std::string new_job);

	bool has_job_position(std::string job);

	void delete_job_position(std::string job);

	void set_location(std::string latitude, std::string longitude);

	std::string get_latitude() const;

	std::string get_longitude() const;

	std::string distance_to(const User &other);

};


#endif /* APP_SERVER_USER_H */
