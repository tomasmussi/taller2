#include "Notificator.h"
#include "sstream"
#include <json/json.h>

Notificator::Notificator(Token_FCM & token,TYPENOTIFICATOR type, std::string message):
	FIREBASE_KEY("AIzaSyB0Dd993SZP4dAUySqZzcNZnt4HFd_RLWo"){
		fb_id_sender = token.get_fb_id();
		this->message = message;
		tokenFCM = token.get_token();
		this->type = type;
}

void Notificator::send(){
	/*curlpp::options::Url myUrl("https://fcm.googleapis.com/fcm/send");
	curlpp::Easy myRequest;
	myRequest.setOpt(myUrl);

	std::list<std::string> header;
	header.push_back("Content-Type: application/json");
	std::ostringstream Authorization;
	Authorization<<"Authorization: key=";
	Authorization<<FIREBASE_KEY;

	header.push_back(Authorization.str());
	myRequest.setOpt(new curlpp::options::HttpHeader(header));
*/	
	Json::Value jsoni;
	Json::Value data;
 
	data["message"] = this->message;
	switch(type){
		case TYPENOTIFICATOR::CHAT:
			data["type"] = "CHAT";
			break;
		case TYPENOTIFICATOR::FRIEND_REQUEST:
			data["type"] = "FRIEND_REQUEST";
			break;
		default:
			data["type"] = "NULL";
	}
	data["fb_ib_sender"] = this->fb_id_sender;

	Json::Value to;
	to["to"] = this->tokenFCM;

	jsoni["data"].append(data);
	jsoni["to"].append(to);
	//std::string body = "{\"data\": { \"mensaje\": \"oh por dios\"}, \"to\": \"eDSpyrzlxKQ:APA91bGBze7mTQK3OnIWJf-WTNRIYvFDbLNGsVjtMMliVRcjUF6AqsNbZhXTYcSS5srb6fSUSZ-yrB9NC7mX2hV6AjJAmF1Vz2fFuWVUX8oSDnPV1KcnStt6DNR0gyhLibjrMXuu2-MA\"}";
	/*myRequest.setOpt(new curlpp::options::PostFields(body.c_str()));
	myRequest.setOpt(new curlpp::options::PostFieldSize(body.size()));
	myRequest.perform();*/
}