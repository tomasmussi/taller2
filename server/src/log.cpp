#include "log.h"
#include <iostream>
#include <string>

#define PATH_LOGii "./log.txt"
Log *Log::instance = NULL;

Log::Log(): category(log4cpp::Category::getInstance(PATH_LOGii)) {
	std::string format = " %d:%p - %m%n";
	appender = new log4cpp::FileAppender("FileAppender",PATH_LOGii);
	layoutPattern = new log4cpp::PatternLayout();
	layoutPattern->setConversionPattern(format);
	appender->setLayout(layoutPattern);
	category.setAppender(appender);
	category.setPriority(log4cpp::Priority::DEBUG);
}

Log* Log::get_instance() {
	if(Log::instance == NULL) {
		Log::instance = new Log();
	}
	return Log::instance;
}

void Log::log_warning(const std::string& menssage) {
	category.warn(menssage);
}

void Log::log_error(const std::string& menssage) {
	category.error(menssage);
}

void Log::log_info(const std::string& menssage) {
	category.info(menssage);
}

void Log::log_debug(const std::string& menssage){	
	category.debug(menssage);
}

Log::~Log() {
	log4cpp::Category::shutdown();
}
