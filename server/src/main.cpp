#ifndef _MSC_VER
#include <unistd.h>
#include <stdlib.h>
#else
#include <time.h>
#endif
#include <signal.h>
#include <mongoose/Server.h>

#include <mongoose/JsonController.h>

using namespace std;
using namespace Mongoose;

#include "LinkedinWebController.h"

class MyJson : public JsonController
{
    public:
        void hello(Request &request, JsonResponse &response)
        {
            int i;

            for (i=0; i<12; i++) {
                response["users"][i]["Name"] = "Bob";
            }

            response["timestamp"] = (int)time(NULL);
        }

        void setup()
        {
            // Example of prefix, putting all the urls into "/api"
            setPrefix("/api");

            // Hello demo
            addRouteResponse("GET", "/", MyJson, hello, JsonResponse);
            addRouteResponse("GET", "/hello", MyJson, hello, JsonResponse);
        }
};

volatile static bool running = true;

void handle_signal(int sig)
{
    (void) sig;
    if (running) {
        cout << "Exiting..." << endl;
        cout << "Tranca... que el control+c no interrumpio nada grave..." << endl;
        running = false;
    }
}
int main()
{
    int t;
#ifdef _MSC_VER
    time_t ltime;
    time(&ltime);
    t = ltime;
#else
    t = time(NULL);
#endif
    srand(t);

    signal(SIGINT, handle_signal);

    LinkedinWebController myController;
    MyJson json;
    Server server(8080);
    server.registerController(&myController);
    server.registerController(&json);
    server.setOption("enable_directory_listing", "false");
    server.start();

    cout << "Server started, routes:" << endl;
    myController.dumpRoutes();

    while (running) {
#ifdef WIN32
        Sleep(1000);
#else
        sleep(1);
#endif
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