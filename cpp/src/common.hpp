#ifndef __QT_WRAPPER__
#define __QT_WRAPPER__
#include <QApplication>
#include <QLabel>
#include <QPushButton>
#include <QtCore/qstring.h>
#include <QLayout>
#include <QtCore/QObject>
#include <QAbstractButton>
#include <QLineEdit>
#include <QCheckBox>
#include <QRadioButton>
#include <QSlider>
#include <QComboBox>
#include <QListWidget>
#include <QTableView>

#include <unordered_map>
#include <functional>

#include <stdlib.h>
#include <string.h>

template <typename T>
void require_non_null(T * ptr, const char * message) {
    if (ptr == NULL || ptr == nullptr) {
        perror(message);
        exit(EXIT_FAILURE);
    }
}


#endif