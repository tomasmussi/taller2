#ifndef APP_SERVER_CHAT_H
#define APP_SERVER_CHAT_H

#include <string>
#include <list>

#include "Message.h"

class Chat {
private:
	std::list<Message> messages_;
public:
	Chat(std::string json_value);

	std::string database_serialize();

	void add_message(std::string sender_id, std::string receiver_id, std::string message);
};


#endif /* APP_SERVER_CHAT_H */
