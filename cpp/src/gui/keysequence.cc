#include "../common.hpp"

void * keysequence(const char * key) {
    return new QKeySequence(key);
}