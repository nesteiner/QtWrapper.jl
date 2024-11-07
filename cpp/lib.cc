#ifndef __QT_WRAPPER__
#define __QT_WRAPPER__
#include <QApplication>
#include <QLabel>
#include <QPushButton>
#include <QtCore/qstring.h>


extern "C" {
    #include "src/wrapper.cc"

    void free_qobject(void * qobject) {
        delete static_cast<QObject*>(qobject);
    }
}

#endif