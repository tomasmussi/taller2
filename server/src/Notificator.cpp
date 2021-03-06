#include "Notificator.h"
#include "sstream"
#include <json/json.h>
#include <iostream>
#include <curlpp/cURLpp.hpp>
#include <curlpp/Easy.hpp>
#include <curlpp/Options.hpp>

Notificator::Notificator(Token_FCM & token,TYPE_NOTIFICATOR type, std::string message):
	FIREBASE_KEY("AIzaSyCwjqxjEUOH393aTr6o64nDoCcirwtntFk") {
		fb_id_sender = token.get_fb_id();
		this->message = message;
		tokenFCM = token.get_token();
		this->type = type;
}

Notificator::Notificator(Token_FCM & token,TYPE_NOTIFICATOR type, std::string message, std::string sender_id):
	FIREBASE_KEY("AIzaSyCwjqxjEUOH393aTr6o64nDoCcirwtntFk"), fb_id_sender(sender_id) {
		this->message = message;
		tokenFCM = token.get_token();
		this->type = type;
}

void Notificator::send(){
	curlpp::options::Url myUrl("https://fcm.googleapis.com/fcm/send");
	curlpp::Easy myRequest;
	myRequest.setOpt(myUrl);

	std::list<std::string> header;
	header.push_back("Content-Type: application/json");
	std::ostringstream Authorization;
	Authorization<<"Authorization: key=";
	Authorization<<FIREBASE_KEY;
	std::cout<<Authorization.str()<<std::endl;
	header.push_back(Authorization.str());
	myRequest.setOpt(new curlpp::options::HttpHeader(header));
	
	Json::Value json;
	Json::Value data;
 
	data["mensaje"] = this->message;
	switch(type){
		case TYPE_NOTIFICATOR::CHAT:
			data["type"] = "CHAT";
			break;
		case TYPE_NOTIFICATOR::FRIEND_REQUEST:
			data["type"] = "FRIEND_REQUEST";
			break;
		default:
			data["type"] = "NULL";
	}
	data["fb_id_sender"] = this->fb_id_sender;

	json["data"] = data;
	json["to"] = this->tokenFCM;

	Json::FastWriter fastWriter;
	std::string body = fastWriter.write(json);
	std::cout<<body<<std::endl; 
	myRequest.setOpt(new curlpp::options::PostFields(body.c_str()));
	myRequest.setOpt(new curlpp::options::PostFieldSize(body.size()));
	myRequest.perform();
}