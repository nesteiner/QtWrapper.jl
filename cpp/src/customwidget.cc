#include "customwidget.h"



void CustomWidget::register_slot(const char *signal_name, void (*slot)(void *)) {
    slotmap[std::string(signal_name)] = [slot](void *data) {
        slot(data);
    };

    connect(this, &CustomWidget::custom_signal, this, &CustomWidget::on_custom_signal);
}

void CustomWidget::emit_custom_signal(const char *signal_name, void *data) {
    emit custom_signal(signal_name, data);
}

void CustomWidget::on_custom_signal(const char *signal_name, void *user_data) {
    auto it = slotmap.find(std::string(signal_name));
    if (it != slotmap.end()) {
        it->second(user_data);
    } else {
        qWarning() << "signal not found: " << signal_name;
    }
}