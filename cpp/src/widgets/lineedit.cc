#include "../common.hpp"

void * lineedit(const char * text, void * parent) {
    require_non_null(text, "lineedit, text is null");

    QString qstring(text);
    return new QLineEdit(qstring, static_cast<QWidget *>(parent));
}

void lineedit_connect_text_changed(void * pwidget, void (*callback)(const char *)) {
    require_non_null(pwidget, "lineedit_connect_text_changed, pwidget is null");
    require_non_null(callback, "lineedit_connect_text_changed, callback is null");

    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::textChanged, lineedit, [callback](const QString & qstring) {
        std::string s = qstring.toStdString();
        callback(s.data());
    });
}

void lineedit_disconnect_text_changed_all(void * pwidget) {
    require_non_null(pwidget, "lineedit_disconnect_text_changed_all, pwidget is null");
    
    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::textChanged, lineedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect text changed signal");
    }    
}

void lineedit_connect_editing_finished(void * pwidget, void (*callback)()) {
    require_non_null(pwidget, "lineedit_connect_editing_finished, pwidget is null");
    require_non_null(callback, "lineedit_connect_editing_finished, callback is null");

    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::editingFinished, lineedit, callback);
}

void lineedit_disconnect_editing_finished_all(void * pwidget) {
    require_non_null(pwidget, "lineedit_disconnect_editing_finished_all, pwidget is null");

    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::editingFinished, lineedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect editing finished signal");
    }    
}

void lineedit_connect_return_pressed(void * pwidget, void (*callback)()) {
    require_non_null(pwidget, "lineedit_connect_return_pressed, pwidget is null");

    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::returnPressed, lineedit, callback);
}

void lineedit_disconnect_return_pressed_all(void * pwidget) {
    require_non_null(pwidget, "lineedit_disconnect_return_pressed_all, pwidget is null");

    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::returnPressed, lineedit, nullptr);

    if (!result) {
        qWarning("failed to disconnect return pressed signal");
    }    
}

void lineedit_connect_cursor_position_changed(void * pwidget, void (*callback)(int, int)) {
    require_non_null(pwidget, "lineedit_connect_cursor_position_changed, pwidget is null");
    require_non_null(callback, "lineedit_connect_cursor_position_changed, callback is null");

    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    QObject::connect(lineedit, &QLineEdit::cursorPositionChanged, lineedit, callback);
}

void lineedit_disconnect_cursor_position_changed_all(void * pwidget) {
    require_non_null(pwidget, "lineedit_disconnect_cursor_position_changed_all, pwidget is null");

    QLineEdit * lineedit = static_cast<QLineEdit*>(pwidget);
    bool result = QObject::disconnect(lineedit, &QLineEdit::cursorPositionChanged, lineedit, nullptr);
    
    if (!result) {
        qWarning("failed to disconnect cursor position changed signal");
    }
}
