#include "TokenFCMHandler.h"
#include "DatabaseHandler.h"
#include "TokenFCM.h"

TokenFCMHandler::TokenFCMHandler(){}
TokenFCMHandler::~TokenFCMHandler(){}
TokenFCMHandler::TokenFCMHandler(TokenFCMHandler const &){}
void TokenFCMHandler::operator=(TokenFCMHandler const &){}

TokenFCMHandler & TokenFCMHandler::get_instance(){
	static TokenFCMHandler instance;
	return instance;
}

void TokenFCMHandler::save_token(const Token_FCM & token){
	DatabaseHandler::get_instance().write("token_FCM-" + token.get_fb_id(), 
											token.get_token());
}

Token_FCM TokenFCMHandler::read_token(const std::string & fb_id){
	std::string token_FCM = DatabaseHandler::get_instance().read("token_FCM-" + fb_id);
	Token_FCM token(fb_id,token_FCM);
	return token;
}
