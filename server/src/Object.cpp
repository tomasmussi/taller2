#include "Object.h"


Object::Object() {

}

Object::Object(int id) : id_(id) {
}

Object::~Object() {
}

int Object::id() {
	return id_;
}
