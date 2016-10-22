#ifndef __LOG_H__
#define __LOG_H__
#define LOG4CPP_FIX_ERROR_COLLISION 1
#include <log4cpp/Category.hh>
#include <log4cpp/FileAppender.hh>
#include <log4cpp/SimpleLayout.hh>
#include <log4cpp/PatternLayout.hh>
#include <string>

/* Modo de uso: es un sigleton
		luego de obtener la instancia se deben ejecutar los metodos 
		log según	la categoría del mensaje que se quiera loguear
*/

class Log {
private:
	log4cpp::Category& category;
	log4cpp::Appender *appender;
	log4cpp::Layout *layout;
	log4cpp::PatternLayout *layoutPattern;
	static Log *instance;
	Log();

public:
	static Log* getInstance();
	~Log();
	
	void logWarning(const std::string& menssage);
	void logError(const std::string& menssage);
	void logInfo(const std::string& menssage);
	void logDebug(const std::string& menssage);
};

#endif
