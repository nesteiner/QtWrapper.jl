#ifndef __QT_WRAPPER_CC__
#define __QT_WRAPPER_CC__

#include <QApplication>
#include <QLabel>
#include <QPushButton>
#include <QtCore/qstring.h>
#include <QLayout>
#endif

void * push_button(const char * text, void * parent) {
    QString string(text);
    return new QPushButton(string, static_cast<QWidget *>(parent));
}