#include <gtest/gtest.h>
#include "DatabaseHandler.h"
#include <string>

TEST(DBTEST, WriteAndRead) {
	std::string padron("91985");
	DatabaseHandler::get_instance().write("padron_eze","91985");
	std::string result = DatabaseHandler::get_instance().read("padron_eze");
	EXPECT_EQ(result,padron);
}

TEST(Gtest, Test1Equals0) {
	EXPECT_EQ(1,1);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}

//g++ -Wall -g -pthread -o pruesalida prueba.cpp -lgtest_main  -lgtest -lpthread

