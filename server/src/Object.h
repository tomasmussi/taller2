#ifndef APP_SERVER_OBJECT_H
#define APP_SERVER_OBJECT_H


class Object {
private:
	int id_;
public:
	Object();
	Object(int id);
	~Object();
	int id();
};


#endif /* APP_SERVER_OBJECT_H */
