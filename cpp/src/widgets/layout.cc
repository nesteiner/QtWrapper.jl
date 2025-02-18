#include "../common.hpp"
void * horizontal_layout() {
    return new QHBoxLayout();
}

void * vertical_layout() {
    return new QVBoxLayout();
}

void horizontal_add_layout(void * layout, void * sub_layout) {
    require_non_null(layout, "horizontal add layout, layout is null");
    require_non_null(sub_layout, "horizontal add layout, sub layout is null");

    static_cast<QHBoxLayout *>(layout)->addLayout(static_cast<QLayout *>(sub_layout));
}

void vertical_add_layout(void * layout, void * sub_layout) {
    require_non_null(layout, "vertical add layout, layout is null");
    require_non_null(sub_layout, "vertical add layout, sub layout is null");

    static_cast<QVBoxLayout *>(layout)->addLayout(static_cast<QLayout *>(sub_layout));
}

void horizontal_add_stretch(void * layout) {
    require_non_null(layout, "horizontal add stretch, layout is null");

    static_cast<QHBoxLayout *>(layout)->addStretch();
}

void vertical_add_stretch(void * layout) {
    require_non_null(layout, "vertical add stretch, layout is null");

    static_cast<QVBoxLayout *>(layout)->addStretch();
}

void layout_add_widget(void * layout, void * widget) {
    require_non_null(layout, "layout add widget, layout is null");
    require_non_null(widget, "layout add widget, widget is null");

    static_cast<QLayout *>(layout)->addWidget(static_cast<QWidget *>(widget));
}