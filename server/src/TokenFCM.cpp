#include "TokenFCM.h"
#include <string>

Token_FCM::Token_FCM(std::string fb_id,std::string token_FCM):
				fb_id(fb_id),token(token_FCM){}
	
std::string Token_FCM::get_fb_id() const{
	return fb_id;
}

std::string Token_FCM::get_token() const {
	return token;
}