#include "../common.hpp"

void * checkbox(const char * text, void * parent) {
    require_non_null(text, "checkbox, text is null");
    
    QString qstring(text);
    return new QCheckBox(qstring, static_cast<QWidget*>(parent));
}

void checkbox_connect_toggled(void * pwidget, void (*callback)(bool)) {
    require_non_null(pwidget, "checkbox_connect_toggled, pwidget is null");
    require_non_null(callback, "checkbox_connect_toggled, callback is null");

    QCheckBox * checkbox = static_cast<QCheckBox*>(pwidget);
    QObject::connect(checkbox, &QCheckBox::toggled, checkbox, callback);
}

void checkbox_disconnect_toggled_all(void * pwidget) {
    require_non_null(pwidget, "checkbox_disconnect_toggled_all, pwidget is null");

    QCheckBox * checkbox = static_cast<QCheckBox*>(pwidget);
    bool result = QObject::disconnect(checkbox, &QCheckBox::toggled, checkbox, nullptr);

    if (!result) {
        qWarning("failed to disconnect toggled signal");
    }
}