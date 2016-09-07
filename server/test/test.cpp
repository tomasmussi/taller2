#include <gtest/gtest.h>
#include "DBHandler.h"
#include <string>

TEST(DBTEST, WriteAndRead) {
	DBHandler db("prueba");
	std::string padron("91985");
	db.write("padron_eze","91985");
	std::string result = db.read("padron_eze");    
	EXPECT_EQ(result,padron);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}

//g++ -Wall -g -pthread -o pruesalida prueba.cpp -lgtest_main  -lgtest -lpthread

