#include <gtest/gtest.h>
#include <json/json.h>

#include <ctime>
#include <string>

#include "Chat.h"
#include "DatabaseHandler.h"
#include "UserHandler.h"
#include "User.h"
#include "UserList.h"
#include "TokenFCMHandler.h"
#include "TokenFCM.h"

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

TEST(SERVER,integration){
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
}
TEST(Token_FCM,WriteAndRead){
	std::string fb_id = "id_fb";
	std::string token_FCM = "1234";
	Token_FCM token(fb_id,token_FCM);
	EXPECT_EQ(token.get_fb_id(),"id_fb");
	EXPECT_EQ(token.get_token(),"1234");
}

TEST(TokenFCMHandler, WriteAndRead){
	std::string fb_id = "id_fb";
	std::string token_FCM = "1234";
	Token_FCM token(fb_id,token_FCM);
	TokenFCMHandler::get_instance().save_token(token);
	Token_FCM tokenLeido = TokenFCMHandler::get_instance().read_token(fb_id);
	EXPECT_EQ(tokenLeido.get_token(), "1234");
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

TEST(UserTest, UsersAreFriends) {
	std::string user = "{\"user\" : { \"friends\" : [\"luis_fb_id\"], \"fb_id\" : \"tomas_fb_id\",	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : { \"friends\" : [\"tomas_fb_id\"], \"fb_id\" : \"luis_fb_id\",	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);
	EXPECT_TRUE(tomas.is_friend(luis));
	EXPECT_TRUE(luis.is_friend(tomas));
}

TEST(UserTest, UsersAreNOTFriends) {
	std::string user = "{\"user\" : { \"fb_id\" : \"tomas_fb_id\",	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : { \"fb_id\" : \"luis_fb_id\",	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);
	EXPECT_FALSE(tomas.is_friend(luis));
	EXPECT_FALSE(luis.is_friend(tomas));
}

TEST(UserTest, UserVoteForFriendUser) {
	std::string user = "{\"user\" : { \"friends\" : [\"luis_fb_id\"], \"fb_id\" : \"tomas_fb_id\", \"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : { \"friends\" : [\"tomas_fb_id\"], \"fb_id\" : \"luis_fb_id\", \"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);
	tomas.vote_for(luis);
	EXPECT_EQ(luis.votes(), 1);
	tomas.vote_for(luis);
	EXPECT_EQ(luis.votes(), 1);
}

TEST(UserTest, UserCantVoteForNONFriendUser) {
	std::string user = "{\"user\" : { \"fb_id\" : \"tomas_fb_id\", \"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : { \"fb_id\" : \"luis_fb_id\", \"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);
	EXPECT_EQ(luis.votes(), 0);
	tomas.vote_for(luis);
	EXPECT_EQ(luis.votes(), 0);
	tomas.vote_for(luis);
	EXPECT_EQ(luis.votes(), 0);
}

TEST(UserTest, WhoVotedForMe) {
	std::string user = "{\"user\" : { \"friends\" : [\"luis_fb_id\"], \"fb_id\" : \"tomas_fb_id\",	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	std::string user2 = "{\"user\" : { \"friends\" : [\"tomas_fb_id\"], \"fb_id\" : \"luis_fb_id\",	\"name\" : \"Luis Arancibia\", \"email\": \"aran.com.ar\", \"dob\" : \"12/08/1991\", \"city\" : \"Ciudad de Buenos Aires\"}";
	User tomas(user);
	User luis(user2);

	EXPECT_FALSE(luis.was_voted_by(tomas));
	tomas.vote_for(luis);
	EXPECT_TRUE(luis.was_voted_by(tomas));
	EXPECT_FALSE(luis.was_voted_by(luis));
}

TEST(UserTest, UserCantVoteForHimself) {
	std::string user = "{\"user\" : { \"friends\" : [\"luis_fb_id\"], \"fb_id\" : \"tomas_fb_id\",	\"name\" : \"Tomas Mussi\", \"email\": \"tomasmussi@gmail.com\", \"profile_photo\" : \"QURQIEdtYkgK...dHVuZw==\" } }";
	User tomas(user);
	EXPECT_EQ(tomas.votes(), 0);
	tomas.vote_for(tomas);
	EXPECT_EQ(tomas.votes(), 0);
	EXPECT_FALSE(tomas.was_voted_by(tomas));
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

TEST(MessageTest, ConstructFromString) {
	std::string users = "{\"message\":[ \"fb_id_tomas\", \"fb_id_luis\"]}";
	std::string message_json = "{\n\t\"message\" : \"hola\",\n\t\"receiver_id\" : \"recv_id\",\n\t\"sender_id\" : \"send_id\",\n\t\"timestamp\" : \"2016-11-04 22:28:01\"\n}";
	Message m(message_json);
	EXPECT_EQ(m.get_message(), "hola");
	EXPECT_EQ(m.get_sender_id(), "send_id");
	EXPECT_EQ(m.get_receiver_id(), "recv_id");
	EXPECT_EQ(m.get_timestamp(), "2016-11-04 22:28:01");
}

TEST(MessageTest, CreateNewMessage) {
	Message m("sender", "receiver", "message");
	time_t rawtime;
	struct tm * timeinfo;
	char buffer[80];

	time (&rawtime);
	timeinfo = localtime(&rawtime);

	// strftime(buffer,80,"%d-%m-%Y %I:%M:%S",timeinfo);
	strftime(buffer,80,"%Y-%m-%d %H:%M:%S",timeinfo);
	std::string time_stamp(buffer);
	EXPECT_EQ(m.get_message(), "message");
	EXPECT_EQ(m.get_sender_id(), "sender");
	EXPECT_EQ(m.get_receiver_id(), "receiver");
	EXPECT_GE(m.get_timestamp(), time_stamp);
}

TEST(MessageTest, MessageSerialize) {
	Message m("sender", "receiver", "message");
	time_t rawtime;
	struct tm * timeinfo;
	char buffer[80];

	time (&rawtime);
	timeinfo = localtime(&rawtime);

	// strftime(buffer,80,"%d-%m-%Y %I:%M:%S",timeinfo);
	strftime(buffer,80,"%Y-%m-%d %H:%M:%S",timeinfo);
	std::string time_stamp(buffer);
	std::string expected = "{\n\t\"message\" : \"message\",\n\t\"receiver_id\" : \"receiver\",\n\t\"sender_id\" : \"sender\",\n\t\"timestamp\" : \"" + time_stamp + "\"\n}";
	Json::Value root = m.serialize();
	std::ostringstream os;
	os << root;
	EXPECT_EQ(expected, os.str());
}

TEST(MessageTest, MessageDatabaseSerialize) {
	Message m("sender", "receiver", "message");
	time_t rawtime;
	struct tm * timeinfo;
	char buffer[80];

	time (&rawtime);
	timeinfo = localtime(&rawtime);

	// strftime(buffer,80,"%d-%m-%Y %I:%M:%S",timeinfo);
	strftime(buffer,80,"%Y-%m-%d %H:%M:%S",timeinfo);
	std::string time_stamp(buffer);
	std::string expected = "{\n\t\"message\" : \"message\",\n\t\"receiver_id\" : \"receiver\",\n\t\"sender_id\" : \"sender\",\n\t\"timestamp\" : \"" + time_stamp + "\"\n}";
	EXPECT_EQ(expected, m.database_serialize());
}

TEST(ChatTest, CreateEmptyChat) {
	Chat chat("");
	std::string expected = "{\n\t\"messages\" : []\n}";
	EXPECT_EQ(expected, chat.database_serialize());
}

TEST(ChatTest, CreateChatWithMessage) {
	time_t rawtime;
	struct tm * timeinfo;
	char buffer[80];

	time (&rawtime);
	timeinfo = localtime(&rawtime);

	// strftime(buffer,80,"%d-%m-%Y %I:%M:%S",timeinfo);
	strftime(buffer,80,"%Y-%m-%d %H:%M:%S",timeinfo);
	std::string time_stamp(buffer);
	Chat chat("");
	chat.add_message("send", "recv", "hola");
	std::string expected = "{\n\t\"messages\" : \n\t[\n\t\t\"{\\n\\t\\\"message\\\" : \\\"hola\\\",\\n\\t\\\"receiver_id\\\" : \\\"recv\\\",\\n\\t\\\"sender_id\\\" : \\\"send\\\",\\n\\t\\\"timestamp\\\" : \\\"" + time_stamp + "\\\"\\n}\"\n\t]\n}";
	EXPECT_EQ(expected, chat.database_serialize());
}

TEST(ChatTest, RetrieveMessagesWithLimit) {
	Chat chat("");
	chat.add_message("send", "recv", "hola");
	chat.add_message("send", "recv", "hola");
	chat.add_message("send", "recv", "hola");
	chat.add_message("send", "recv", "hola");

	EXPECT_EQ(4, chat.view_messages().size());
	EXPECT_EQ(1, chat.view_messages("1").size());
	EXPECT_EQ(3, chat.view_messages("3").size());

	for (int i = 0; i < 10; i++) {
		chat.add_message("send", "recv", "hola");
	}
	EXPECT_EQ(10, chat.view_messages().size());
	EXPECT_EQ(14, chat.view_messages("0").size());
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}

//g++ -Wall -g -pthread -o pruesalida prueba.cpp -lgtest_main  -lgtest -lpthread

