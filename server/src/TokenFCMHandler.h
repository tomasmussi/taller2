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
	void save_token(const Token_FCM & token);
	Token_FCM read_token(const std::string & fb_id);
};
#endif