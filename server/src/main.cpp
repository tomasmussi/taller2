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


int main(int argc, char *argv[]) {
	int t;
	t = time(NULL);
	srand(t);

	signal(SIGINT, handle_signal);
	std::string url("https://guarded-sands-84788.herokuapp.com");
	if (argc == 2) {
		url = std::string(argv[1]);
	}
	ApiJsonController json(url);

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

