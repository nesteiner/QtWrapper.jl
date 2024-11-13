#include "../common.h"

void * checkbox(const char * text, void * parent) {
    QString qstring(text);
    return new QCheckBox(qstring, static_cast<QWidget*>(parent));
}

void checkbox_connect_toggled(void * pwidget, void (*callback)(bool)) {
    QCheckBox * checkbox = static_cast<QCheckBox*>(pwidget);
    QObject::connect(checkbox, &QCheckBox::toggled, checkbox, callback);
}

void checkbox_disconnect_toggled_all(void * pwidget) {
    QCheckBox * checkbox = static_cast<QCheckBox*>(pwidget);
    bool result = QObject::disconnect(checkbox, &QCheckBox::toggled, checkbox, nullptr);

    if (!result) {
        qWarning("failed to disconnect toggled signal");
    }
}