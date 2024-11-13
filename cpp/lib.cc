#include "src/common.h"

extern "C" {
    #include "src/wrapper.cc"
    #include "src/widgets/customwidget.h"       
    typedef struct CustomWidget CustomWidget;    
    void free_qobject(void * qobject) {
        delete static_cast<QObject*>(qobject);
    }

    void disconnect_all(void * pwidget) {
        QObject * widget = static_cast<QObject*>(pwidget);
        widget -> disconnect();
    }

    void * custom_widget(void * parent) {
        return new CustomWidget(static_cast<QWidget*>(parent));
    }

    void custom_register_slot(void * pwidget, const char * signal_name, void (*slot)(void *)) {
        static_cast<CustomWidget*>(pwidget) -> register_slot(signal_name, slot);
    }

    void custom_emit_signal(void * pwidget, const char * signal_name, void * user_data) {
        static_cast<CustomWidget*>(pwidget) -> emit_custom_signal(signal_name, user_data);
    }

    void free_common(void * ptr) {
        delete ptr;
    }
}