#include "../common.h"

void combobox_connect_activated(void * pwidget, void (*callback)(int)) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    QObject::connect(combobox, &QComboBox::activated, combobox, callback);
}

void combobox_disconnect_activated_all(void * pwidget) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    bool result = QObject::disconnect(combobox, &QComboBox::activated, combobox, nullptr);

    if (!result) {
        qWarning("failed to disconnect activated signal");
    }
}

void combobox_connect_current_index_changed(void * pwidget, void (*callback)(int)) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    QObject::connect(combobox, &QComboBox::currentIndexChanged, combobox, callback);
}

void combobox_disconnect_current_index_changed_all(void * pwidget) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    bool result = QObject::disconnect(combobox, &QComboBox::currentIndexChanged, combobox, nullptr);

    if (!result) {
        qWarning("failed to disconnect current index changed signal");
    }
}

void combobox_connect_current_text_changed(void * pwidget, void (*callback)(const char *)) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    QObject::connect(combobox, &QComboBox::currentTextChanged, combobox, [callback](const QString & qstring) {
        std::string s = qstring.toStdString().c_str();
        callback(s.data());
    });
}

void combobox_disconnect_current_text_changed_all(void * pwidget) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    bool result = QObject::disconnect(combobox, &QComboBox::currentTextChanged, combobox, nullptr);

    if (!result) {
        qWarning("failed to disconnect current text changed signal");
    }
}

void combobox_connect_highlighted(void * pwidget, void (*callback)(int)) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    QObject::connect(combobox, &QComboBox::highlighted, combobox, callback);
}

void combobox_disconnect_highlighted_all(void * pwidget) {
    QComboBox * combobox = static_cast<QComboBox*>(pwidget);
    bool result = QObject::disconnect(combobox, &QComboBox::highlighted, combobox, nullptr);

    if (!result) {
        qWarning("failed to disconnect highlighted signal");
    }
}
