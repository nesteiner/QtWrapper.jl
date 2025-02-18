#include "common.hpp"

static QApplication * global_application = nullptr;
void * application(int argc, char ** argv) {
    if (global_application == nullptr) {
        global_application = new QApplication(argc, argv);
    }
    
    return global_application;
}

void exec(void * app) {
    require_non_null(app, "exec, app is null");

    QApplication * qapp = static_cast<QApplication *>(app);
    qapp->exec();
}