#include "common.h"

void * label(const char * text, void * parent) {
    return new QLabel(text, static_cast<QWidget *>(parent));
}