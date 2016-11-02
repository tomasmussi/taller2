#include <gtest/gtest.h>
#include "DatabaseHandler.h"
#include "UserHandler.h"
#include "User.h"
#include "UserList.h"
#include <string>

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
		\"job_positions\" : [],\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"requests\" : [],\n\
		\"skills\" : \n\
		[\n\
			\"1\",\n\
			\"2\"\n\
		],\n\
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
		\"job_positions\" : [],\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"requests\" : [],\n\
		\"skills\" : \n\
		[\n\
			\"1\",\n\
			\"2\"\n\
		],\n\
		\"summary\" : \"Estudiante de ingenieria informatica de la UBA.\",\n\
		\"votes\" : []\n\
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
		\"job_positions\" : [],\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"requests\" : \n\t\t[\n\t\t\t\"luis-fb-id\"\n\t\t],\n\
		\"skills\" : [],\n\
		\"summary\" : \"\",\n\
		\"votes\" : []\n\
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
		\"job_positions\" : [],\n\
		\"name\" : \"Tomas Mussi\",\n\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\n\
		\"requests\" : [],\n\
		\"skills\" : [],\n\
		\"summary\" : \"\",\n\
		\"votes\" : []\n\
	}\n\
}";
	EXPECT_EQ(tomas.database_serialize(), expected);
}


TEST(UserTest, UserVoteForOtherUser) {
	std::string user = "{\"user\" : {	\"fb_id\" : \"tomas_fb_id\", \"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : {	\"fb_id\" : \"luis_fb_id\", \"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);
	tomas.vote_for(luis);
	EXPECT_EQ(luis.votes(), 1);
	tomas.vote_for(luis);
	EXPECT_EQ(luis.votes(), 1);
}

TEST(UserTest, WhoVotedForMe) {
	std::string user = "{\"user\" : { \"fb_id\" : \"tomas_fb_id\",	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : { \"fb_id\" : \"luis_fb_id\",	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);

	EXPECT_FALSE(luis.was_voted_by(tomas));
	tomas.vote_for(luis);
	EXPECT_TRUE(luis.was_voted_by(tomas));
	EXPECT_FALSE(luis.was_voted_by(luis));
}

TEST(UserTest, AddSkill) {
	std::string user = "{\"user\" : { \"fb_id\" : \"tomas_fb_id\",	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string skill = "programming";
	User tomas(user);
	EXPECT_FALSE(tomas.has_skill(skill));
	tomas.add_skill(skill);
	EXPECT_TRUE(tomas.has_skill(skill));
}

TEST(UserTest, DeleteSkill) {
	std::string skill = "programming";
	std::string user = "{\"user\" : {\
		\"fb_id\" : \"tomas_fb_id\",\
		\"name\" : \"Tomas Mussi\",\
		\"email\": \"tomasmussi@gmail.com\",\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\
		\"skills\" : [\"" + skill + "\"],\n\
	} }";

	User tomas(user);
	EXPECT_TRUE(tomas.has_skill(skill));
	tomas.delete_skill(skill);
	EXPECT_FALSE(tomas.has_skill(skill));
}

TEST(UserTest, AddJobPosition) {
	std::string user = "{\"user\" : { \"fb_id\" : \"tomas_fb_id\",	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string job = "programmer at Google";
	User tomas(user);
	EXPECT_FALSE(tomas.has_job_position(job));
	tomas.add_job_position(job);
	EXPECT_TRUE(tomas.has_job_position(job));
}

TEST(UserTest, DeleteJobPosition) {
	std::string job = "programmer at Google";
	std::string user = "{\"user\" : {\
		\"fb_id\" : \"tomas_fb_id\",\
		\"name\" : \"Tomas Mussi\",\
		\"email\": \"tomasmussi@gmail.com\",\
		\"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\",\
		\"job_positions\" : [\"" + job + "\"],\n\
	} }";

	User tomas(user);
	EXPECT_TRUE(tomas.has_job_position(job));
	tomas.delete_job_position(job);
	EXPECT_FALSE(tomas.has_job_position(job));
}

TEST(UserHandlerTest, createUser) {
	std::string user_key = "a-fb-user-id";
	DatabaseHandler::get_instance().delete_key(user_key);
	UserHandler::get_instance().create_user(user_key);
	EXPECT_TRUE(UserHandler::get_instance().user_exists(user_key));
}


TEST(UserListTest, createFromString) {
	std::string users = "{\"users\":[ \"fb_id_tomas\", \"fb_id_luis\"]}";
	UserList list(users);
	EXPECT_EQ(list.users_size(), 2);
	EXPECT_TRUE(list.user_exists("fb_id_tomas"));
	EXPECT_TRUE(list.user_exists("fb_id_luis"));
	EXPECT_FALSE(list.user_exists("tomas"));
	EXPECT_FALSE(list.user_exists(""));
}

TEST(UserListTest, emptyList) {
	std::string users = "{\"users\":[]}";
	UserList list(users);
	EXPECT_EQ(list.users_size(), 0);
	EXPECT_FALSE(list.user_exists("tomas"));
	EXPECT_FALSE(list.user_exists(""));
}

TEST(UserListTest, databaseSerialize) {
	std::string users = "{\"users\":[ \"fb_id_tomas\", \"fb_id_luis\"]}";
	UserList list(users);
	std::string expected = "{\n\t\"users\" : \n\t[\n\t\t\"fb_id_tomas\",\n\t\t\"fb_id_luis\"\n\t]\n}";
	EXPECT_EQ(list.database_serialize(), expected);
}

TEST(UserListTest, userListCopy) {
	std::string users = "{\"users\":[ \"fb_id_tomas\", \"fb_id_luis\"]}";
	UserList list(users);
	std::list<std::string> copy = list.users();
	list.add_user("new_fb_id");
	std::list<std::string>::iterator it = copy.begin();
	EXPECT_EQ((*it).compare("fb_id_tomas"), 0);
	it++;
	EXPECT_EQ((*it).compare("fb_id_luis"), 0);
	it++;
	EXPECT_EQ(it, copy.end());
	EXPECT_TRUE(list.user_exists("new_fb_id"));
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}

//g++ -Wall -g -pthread -o pruesalida prueba.cpp -lgtest_main  -lgtest -lpthread

