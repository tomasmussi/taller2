#include "log.h"
#include <iostream>
#include <string>

#define PATH_LOGii "./log2.txt"
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

Log* Log::getInstance() {
	if(Log::instance == NULL) {
		Log::instance = new Log();
	}
	return Log::instance;
}

void Log::logWarning(const std::string& menssage) {
	category.warn(menssage);
}

void Log::logError(const std::string& menssage) {
	category.error(menssage);
}

void Log::logInfo(const std::string& menssage) {
	category.info(menssage);
}

void Log::logDebug(const std::string& menssage){	
	category.debug(menssage);
}

Log::~Log() {
	log4cpp::Category::shutdown();
}
