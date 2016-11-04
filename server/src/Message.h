#ifndef APP_SERVER_MESSAGE_H
#define APP_SERVER_MESSAGE_H

#include <json/json.h>

#include <string>
#include <list>
#include <map>

class Message {
private:
	std::string sender_id_;
	std::string receiver_id_;
	std::string message_;
	std::string timestamp_;

public:
	Message(std::string json_value);
	Message(std::string sender_id,std::string receiver_id, std::string message);
	Message();
	~Message();

	/* Serialize for sending as JSON */
	std::string serialize();
	std::string database_serialize();

	std::string get_sender_id() const;
	std::string get_receiver_id();
	std::string get_message();
	std::string get_timestamp();

};


#endif /* APP_SERVER_MESSAGE_H */
