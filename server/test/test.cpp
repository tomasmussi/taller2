#include <gtest/gtest.h>
#include "DatabaseHandler.h"
#include "UserHandler.h"
#include "User.h"
#include <string>

TEST(Gtest, Test1Equals1) {
	EXPECT_EQ(1,1);
}

TEST(DatabaseHandler, WriteAndRead) {
	std::string clave = "clave";
	DatabaseHandler::get_instance().write(clave,"value");
	EXPECT_EQ(DatabaseHandler::get_instance().read(clave), "value");
	DatabaseHandler::get_instance().write(clave,"new-value");
	EXPECT_EQ(DatabaseHandler::get_instance().read(clave), "new-value");
}

TEST(DatabaseHandler, ReadInvalidKeyReturnsEmpty) {
	EXPECT_EQ(DatabaseHandler::get_instance().read("asgasgjhasgjhgajh"), "");
}

TEST(UserTest, ConstructFromString) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\",\"pass\" : \"tomas\", \"dob\" : \"11/07/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"Estudiante de ingenieria informatica de la UBA.\", \"skills\": [1, 2], \"contacts\" : 4, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	User tomas(user);
	EXPECT_EQ(tomas.get_email(), "tomasmussi@gmail.com");
	EXPECT_EQ(tomas.get_name(), "Tomas Mussi");
	EXPECT_EQ(tomas.get_dob(), "11/07/1991");
	EXPECT_EQ(tomas.get_city(), "Ciudad de Buenos Aires");
	EXPECT_EQ(tomas.get_summary(), "Estudiante de ingenieria informatica de la UBA.");
	EXPECT_EQ(tomas.get_profile_photo(), "QURQIEdtYkgK...dHVuZw==");
}

TEST(UserTest, SerializeToJson) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\",\"pass\" : \"tomas\", \"dob\" : \"11/07/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"Estudiante de ingenieria informatica de la UBA.\", \"skills\": [1, 2], \"contacts\" : 4, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";

	std::string expected = "{\n\
	\"user\" : \n\
	{\n\
		\"city\" : \"Ciudad de Buenos Aires\",\n\
		\"contacts\" : 0,\n\
		\"dob\" : \"11/07/1991\",\n\
		\"email\" : \"tomasmussi@gmail.com\",\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"summary\" : \"Estudiante de ingenieria informatica de la UBA.\"\n\
	}\n\
}";
	User tomas(user);
	EXPECT_EQ(tomas.serialize(), expected);
}

TEST(UserTest, SerializeToJsonWithId) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\",\"pass\" : \"tomas\", \"dob\" : \"11/07/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"summary\" : \"Estudiante de ingenieria informatica de la UBA.\", \"skills\": [1, 2], \"contacts\" : 4, \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";

	std::string expected = "{\n\
	\"user\" : \n\
	{\n\
		\"city\" : \"Ciudad de Buenos Aires\",\n\
		\"dob\" : \"11/07/1991\",\n\
		\"email\" : \"tomasmussi@gmail.com\",\n\
		\"fb_id\" : \"\",\n\
		\"friends\" : [],\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"requests\" : [],\n\
		\"summary\" : \"Estudiante de ingenieria informatica de la UBA.\"\n\
	}\n\
}";
	User tomas(user);
	EXPECT_EQ(tomas.database_serialize(), expected);
}

TEST(UserTest, ConstructFromStringWithEmptyProperties) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	User tomas(user);
	tomas.replace_not_null("email", "newmail@dom.com");
	EXPECT_EQ(tomas.get_email(), "newmail@dom.com");

	tomas.replace_not_null("name", "Juan Pablo");
	EXPECT_EQ(tomas.get_name(), "Juan Pablo");

	EXPECT_EQ(tomas.get_dob(), "");
	tomas.replace_not_null("dob", "12/08/1992");
	EXPECT_EQ(tomas.get_dob(), "12/08/1992");
}

TEST(UserTest, EditCertainField) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	User tomas(user);
	EXPECT_EQ(tomas.get_email(), "tomasmussi@gmail.com");
	EXPECT_EQ(tomas.get_name(), "Tomas Mussi");
	EXPECT_EQ(tomas.get_dob(), "");
	EXPECT_EQ(tomas.get_city(), "");
	EXPECT_EQ(tomas.get_summary(), "");
	EXPECT_EQ(tomas.get_profile_photo(), "QURQIEdtYkgK...dHVuZw==");
}

TEST(UserTest, UserSendRequest) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : {	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);
	tomas.send_request(luis);
	EXPECT_EQ(luis.requests(), 1);
}

TEST(UserTest, UserSendRequestSerialization) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : {	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"fb_id\" : \"luis-fb-id\"}";
	User tomas(user);
	User luis(user2);
	luis.send_request(tomas);
	std::string expected = "{\n\
	\"user\" : \n\
	{\n\
		\"city\" : \"\",\n\
		\"dob\" : \"\",\n\
		\"email\" : \"tomasmussi@gmail.com\",\n\
		\"fb_id\" : \"\",\n\
		\"friends\" : [],\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"requests\" : \n\t\t[\n\t\t\t\"luis-fb-id\"\n\t\t],\n\
		\"summary\" : \"\"\n\
	}\n\
}";
	EXPECT_EQ(tomas.database_serialize(), expected);
}

TEST(UserTest, UserAcceptRequestSerialization) {
	std::string user = "{\"user\" : {	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : {	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\", \"fb_id\" : \"luis-fb-id\"}";
	User tomas(user);
	User luis(user2);
	luis.send_request(tomas);
	tomas.accept_request(luis);
	std::string expected = "{\n\
	\"user\" : \n\
	{\n\
		\"city\" : \"\",\n\
		\"dob\" : \"\",\n\
		\"email\" : \"tomasmussi@gmail.com\",\n\
		\"fb_id\" : \"\",\n\
		\"friends\" : \n\t\t[\n\t\t\t\"luis-fb-id\"\n\t\t],\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"requests\" : [],\n\
		\"summary\" : \"\"\n\
	}\n\
}";
	EXPECT_EQ(tomas.database_serialize(), expected);
}


TEST(UserHandlerTest, createUser) {
	std::string user_key = "a-fb-user-id";
	DatabaseHandler::get_instance().delete_key(user_key);
	UserHandler::get_instance().create_user(user_key);
	EXPECT_TRUE(UserHandler::get_instance().user_exists(user_key));
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}

//g++ -Wall -g -pthread -o pruesalida prueba.cpp -lgtest_main  -lgtest -lpthread

