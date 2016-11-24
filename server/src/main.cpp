#include <unistd.h>
#include <stdlib.h>

#include <signal.h>
#include <mongoose/Server.h>

#include "ApiJsonController.h"
#include "DatabaseHandler.h"

volatile static bool running = true;

void handle_signal(int sig) {
	(void) sig;
	if (running) {
		cout << "Exiting..." << endl;
		running = false;
	}
}


<<<<<<< HEAD
int main() {
=======
int main(int argc, char *argv[]) {
	int t;
	t = time(NULL);
	srand(t);

>>>>>>> feature/location
	signal(SIGINT, handle_signal);
	std::string url("https://guarded-sands-84788.herokuapp.com");
	if (argc > 1) {
		url = std::string(argv[1]);
		if (argc == 3) {
			DatabaseHandler::get_instance(argv[2]);
		}
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

