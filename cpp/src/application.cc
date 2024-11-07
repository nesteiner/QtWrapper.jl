#ifndef __QT_WRAPPER_CC__
#define __QT_WRAPPER_CC__

#include <QApplication>
#include <QLabel>
#include <QPushButton>
#include <QtCore/qstring.h>
#include <QLayout>
#endif

void * application(int argc, char ** argv) {
    return new QApplication(argc, argv);
}

void exec(void * app) {
    QApplication * qapp = static_cast<QApplication *>(app);
    qapp->exec();
}