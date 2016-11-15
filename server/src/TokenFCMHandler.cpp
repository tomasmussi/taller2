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

void TokenFCMHandler::save_token(Token_FCM token){
	DatabaseHandler::get_instance().write("token_FCM-" + token.get_fb_id(), 
											token.get_token());
}

std::string TokenFCMHandler::read_token(std::string fb_id){
	return DatabaseHandler::get_instance().read("token_FCM-" + fb_id);
}
