#ifndef __QT_WRAPPER_CC__
#define __QT_WRAPPER_CC__

#include <QApplication>
#include <QLabel>
#include <QPushButton>
#include <QtCore/qstring.h>
#include <QLayout>
#endif

void * label(const char * text, void * parent) {
    return new QLabel(text, static_cast<QWidget *>(parent));
}