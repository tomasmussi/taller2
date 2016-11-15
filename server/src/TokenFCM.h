#ifndef TOKEN_FCM_H
#define TOKEN_FCM_H
#include <string>

class Token_FCM{
	private:
	std::string fb_id;
	std::string token;

	public:
	Token_FCM(std::string fb_id,std::string token_FCM);
	std::string get_fb_id();
	std::string get_token();	
};
#endif //TOKEN_FCM_H