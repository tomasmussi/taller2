#ifndef TOKEN_FCM_HANDLER
#define TOKEN_FCM_HANDLER
#include <string>
#include "TokenFCM.h"

class TokenFCMHandler{
private:

	TokenFCMHandler();
	~TokenFCMHandler();
	TokenFCMHandler(TokenFCMHandler const &);
	void operator=(TokenFCMHandler const &);

public:
	static TokenFCMHandler & get_instance();
	void save_token(Token_FCM token);
	std::string read_token(std::string fb_id);
};
#endif