#include "../common.hpp"

void * widget(void * parent) {
    return new QWidget(static_cast<QWidget *>(parent));
}

void set_title(void * widget, const char * title) {
    require_non_null(widget, "set_title, widget is null");
    require_non_null(title, "set_title, title is null");

    static_cast<QWidget *>(widget)->setWindowTitle(title);
}

void show_widget(void * widget) {
    require_non_null(widget, "show_widget, widget is null");
    
    static_cast<QWidget *>(widget)->show();
}

void resize(void * widget, int width, int height) {
    require_non_null(widget, "resize, widget is null");
    
    static_cast<QWidget *>(widget)->resize(width, height);
}

void move(void * widget, int x, int y) {
    require_non_null(widget, "move, widget is null");

    static_cast<QWidget *>(widget)->move(x, y);
}

void set_geometry(void * widget, int x, int y, int width, int height) {
    require_non_null(widget, "set_geometry, widget is null");

    static_cast<QWidget *>(widget)->setGeometry(x, y, width, height);
}

void set_layout(void * widget, void * layout) {
    require_non_null(widget, "set_layout, widget is null");

    static_cast<QWidget *>(widget)->setLayout(static_cast<QLayout *>(layout));
}