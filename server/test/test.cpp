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

TEST(Gtest, Test1Equals0) {
	EXPECT_EQ(1,1);
}

TEST(LoginTest, UserNotInSystem) {
	DBHandler db("prueba");
	std::string key = "users";
	std::string user = "invalid-user";
	std::string pass = "invalid-pass";
	EXPECT_FALSE(db.login(user, pass));
}

TEST(LoginTest, UserAuthorized) {
	DBHandler db("prueba");
	std::string key = "users";
	std::string user = "invalid-user";
	std::string pass = "invalid-pass";
	EXPECT_TRUE(db.login(user, pass));
}


int main(int argc, char **argv) {
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}

//g++ -Wall -g -pthread -o pruesalida prueba.cpp -lgtest_main  -lgtest -lpthread

