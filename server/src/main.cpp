#include <unistd.h>
#include <stdlib.h>

#include <signal.h>
#include <mongoose/Server.h>

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
	signal(SIGINT, handle_signal);
	ApiJsonController json;

	Mongoose::Server server(8080);
	server.registerController(&json);
	server.setOption("enable_directory_listing", "false");
	server.start();

	std::cout << "Server started, routes:" << std::endl;
	json.dumpRoutes();

	while (running) {
		sleep(1);
	}
	server.stop();
	return EXIT_SUCCESS;
}

