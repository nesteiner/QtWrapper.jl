#include "customwidget.hpp"

void CustomWidget::register_slot(const char *signal_name, void (*slot)(void *)) {
    require_non_null(signal_name, "custom widget, register_slot, singal name is null");
    require_non_null(slot, "custom widget, register_slot, slot is null");
    slotmap[std::string(signal_name)] = [slot](void *data) {
        slot(data);
    };

    connect(this, &CustomWidget::custom_signal, this, &CustomWidget::on_custom_signal);
}

void CustomWidget::emit_custom_signal(const char *signal_name, void *data) {
    require_non_null(signal_name, "custom widget, emit_custom_signal, signal name is null");
    require_non_null(data, "custom widget, emit_custom_signal, data is null");

    emit custom_signal(signal_name, data);
}

void CustomWidget::on_custom_signal(const char *signal_name, void *user_data) {
    require_non_null(signal_name, "custom widget, on_custom_signal, signal name is null");
    require_non_null(user_data, "custom widget, on_custom_signal, user data is null");
    
    auto it = slotmap.find(std::string(signal_name));
    if (it != slotmap.end()) {
        it->second(user_data);
    } else {
        qWarning() << "signal not found: " << signal_name;
    }
}