#include "../common.h"

void * icon_from_file(const char *path) {
    return new QIcon(path);
}