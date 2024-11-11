#include "common.h"

void * application(int argc, char ** argv) {
    return new QApplication(argc, argv);
}

void exec(void * app) {
    QApplication * qapp = static_cast<QApplication *>(app);
    qapp->exec();
}