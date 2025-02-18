#ifndef CUSTOMWIDGET_H
#define CUSTOMWIDGET_H

#include "../common.hpp"

class Q_WIDGETS_EXPORT CustomWidget : public QWidget {
    Q_OBJECT
private:
    std::unordered_map<std::string, std::function<void(void *)>> slotmap;

public:
    explicit CustomWidget(QWidget *parent = nullptr): QWidget(parent) {}
    ~CustomWidget() {} 

    void register_slot(const char *signal_name, void (*slot)(void *));
    void emit_custom_signal(const char *signal_name, void *data);

signals:
    void custom_signal(const char *signal_name, void *user_data);

public slots:
    void on_custom_signal(const char *signal_name, void *user_data);
};


#endif // CUSTOMWIDGET_H