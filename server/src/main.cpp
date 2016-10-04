#include <unistd.h>
#include <stdlib.h>

#include <signal.h>
#include <mongoose/Server.h>

#include "DBHandler.h"
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
	DBHandler database_handler("testdb");
	// database_handler.test_write();
	// LinkedinWebController link_web_controller;
	ApiJsonController json(&database_handler);

	Mongoose::Server server(8080);
	// server.registerController(&link_web_controller);
	server.registerController(&json);
	server.setOption("enable_directory_listing", "false");
	server.start();

	std::cout << "Server started, routes:" << std::endl;
	// link_web_controller.dumpRoutes();
	json.dumpRoutes();

	while (running) {
		sleep(1);
	}
	server.stop();
	return EXIT_SUCCESS;
}

