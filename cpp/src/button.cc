#include "common.h"

void * push_button(const char * text, void * parent) {
    QString string(text);
    return new QPushButton(string, static_cast<QWidget *>(parent));
}

void * radio_button(const char * text, void * parent) {
    QString string(text);
    return new QRadioButton(string, static_cast<QWidget *>(parent));
}

void button_connect_clicked(void * pwidget, void (*callback)(bool)) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    QObject::connect(button, &QAbstractButton::clicked, button, callback);
}

void button_disconnect_clicked_all(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    bool result = QObject::disconnect(button, &QAbstractButton::clicked, button, nullptr);

    if (!result) {
        qWarning("failed to disconnect clicked signal");
    }
}

void button_connect_pressed(void * pwidget, void (*callback)()) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    QObject::connect(button, &QAbstractButton::pressed, button, callback);
}

void button_disconnect_pressed_all(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    bool result = QObject::disconnect(button, &QAbstractButton::pressed, button, nullptr);

    if (!result) {
        qWarning("failed to disconnect pressed signal");
    }
}

void button_connect_released(void * pwidget, void (*callback)()) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    QObject::connect(button, &QAbstractButton::released, button, callback);
}

void button_disconnect_released(void * pwidget) {
    QAbstractButton * button = static_cast<QAbstractButton*>(pwidget);
    bool result = QObject::disconnect(button, &QAbstractButton::released, button, nullptr);

    if (!result) {
        qWarning("failed to disconnect released signal");
    }    
}

void radiobutton_connect_toggled(void * pwidget, void (*callback)(bool)) {
    QRadioButton * radiobutton = static_cast<QRadioButton*>(pwidget);
    QObject::connect(radiobutton, &QRadioButton::toggled, radiobutton, callback);
}

void radiobutton_disconnect_toggled_all(void * pwidget) {
    QRadioButton * radiobutton = static_cast<QRadioButton*>(pwidget);
    bool result = QObject::disconnect(radiobutton, &QRadioButton::toggled, radiobutton, nullptr);

    if (!result) {
        qWarning("failed to disconnect toggled signal");
    }
}

