#include "../common.hpp"

void slider_connect_value_changed(void * pwidget, void (*callback)(int)) {
    require_non_null(pwidget, "slider_connect_value_changed, pwidget is null");
    require_non_null(callback, "slider_connect_value_changed, callback is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::valueChanged, slider, callback);
}

void slider_disconnect_value_changed_all(void * pwidget) {
    require_non_null(pwidget, "slider_disconnect_value_changed_all, pwidget is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::valueChanged, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect value changed signal");
    }
}

void slider_connect_slider_pressed(void * pwidget, void (*callback)()) {
    require_non_null(pwidget, "slider_connect_slider_pressed, pwidget is null");
    require_non_null(callback, "slider_connect_slider_pressed, callback is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::sliderPressed, callback);
}

void slider_disconnect_slider_pressed_all(void * pwidget) {
    require_non_null(pwidget, "slider_disconnect_slider_pressed_all, pwidget is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::sliderPressed, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect slider pressed signal");
    }
}

void slider_connect_slider_released(void * pwidget, void (*callback)()) {
    require_non_null(pwidget, "slider_connect_slider_released, pwidget is null");
    require_non_null(callback, "slider_connect_slider_released, callback is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::sliderReleased, slider, callback);
}

void slider_disconnect_slider_released_all(void * pwidget) {
    require_non_null(pwidget, "slider_disconnect_slider_released_all, pwidget is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::sliderReleased, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect slider released signal");
    }
}

void slider_connect_slider_moved(void * pwidget, void (*callback)(int)) {
    require_non_null(pwidget, "slider_connect_slider_moved, pwidget is null");
    require_non_null(callback, "slider_connect_slider_moved, callback is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::sliderMoved, slider, callback);
}

void slider_disconnect_slider_moved_all(void * pwidget) {
    require_non_null(pwidget, "slider_disconnect_slider_moved_all, pwidget is null");

    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::sliderMoved, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect slider moved signal");
    }
}
