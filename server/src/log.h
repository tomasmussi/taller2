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
	static Log* get_instance();
	~Log();
	
	void log_warning(const std::string& menssage);
	void log_error(const std::string& menssage);
	void log_info(const std::string& menssage);
	void log_debug(const std::string& menssage);
};

#endif
