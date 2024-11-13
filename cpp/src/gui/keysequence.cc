#include "../common.h"

void * keysequence(const char * key) {
    return new QKeySequence(key);
}