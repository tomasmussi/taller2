#include <unistd.h>
#include <stdlib.h>

#include <signal.h>
#include <mongoose/Server.h>

#include "LinkedinWebController.h"
#include "ApiJsonController.h"

volatile static bool running = true;

void handle_signal(int sig) {
	(void) sig;
	if (running) {
		cout << "Exiting..." << endl;
		running = false;
	}
}

int main() {
	int t;
	t = time(NULL);
	srand(t);

	signal(SIGINT, handle_signal);

	LinkedinWebController myController;
	ApiJsonController json;
	Mongoose::Server server(8080);
	server.registerController(&myController);
	server.registerController(&json);
	server.setOption("enable_directory_listing", "false");
	server.start();

	std::cout << "Server started, routes:" << std::endl;
	myController.dumpRoutes();

	while (running) {
		sleep(1);
	}
	server.stop();
	return EXIT_SUCCESS;
}

/*
#include "DBHandler.h"

int main() {
	DBHandler handler("testdb");
	handler.test_write();
	handler.test_read();
	return 0;
}
*/