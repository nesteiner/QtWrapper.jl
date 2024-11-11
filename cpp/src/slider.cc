#include "common.h"

void slider_connect_value_changed(void * pwidget, void (*callback)(int)) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::valueChanged, slider, callback);
}

void slider_disconnect_value_changed_all(void * pwidget) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::valueChanged, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect value changed signal");
    }
}

void slider_connect_slider_pressed(void * pwidget, void (*callback)()) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::sliderPressed, callback);
}

void slider_disconnect_slider_pressed_all(void * pwidget) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::sliderPressed, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect slider pressed signal");
    }
}

void slider_connect_slider_released(void * pwidget, void (*callback)()) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::sliderReleased, slider, callback);
}

void slider_disconnect_slider_released_all(void * pwidget) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::sliderReleased, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect slider released signal");
    }
}

void slider_connect_slider_moved(void * pwidget, void (*callback)(int)) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    QObject::connect(slider, &QSlider::sliderMoved, slider, callback);
}

void slider_disconnect_slider_moved_all(void * pwidget) {
    QSlider * slider = static_cast<QSlider*>(pwidget);
    bool result = QObject::disconnect(slider, &QSlider::sliderMoved, slider, nullptr);

    if (!result) {
        qWarning("failed to disconnect slider moved signal");
    }
}
