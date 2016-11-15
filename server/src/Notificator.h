#ifndef NOTIFICATOR_H
#define NOTIFICATOR_H
#include <string>
#include "TokenFCM.h"

enum TYPE_NOTIFICATOR{
		CHAT=0,
		FRIEND_REQUEST
	};

class Notificator{
	const std::string FIREBASE_KEY; 

private:
	std::string fb_id_sender; //Indica quien realizo el envio 
	std::string message; //Mensaje
	std::string tokenFCM; //token del destinatario
	TYPE_NOTIFICATOR type;
public:
	
	Notificator(Token_FCM & token,TYPE_NOTIFICATOR type, std::string message);
	void send();
};

#endif //NOTIFICATOR_H