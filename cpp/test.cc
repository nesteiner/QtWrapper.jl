#include "src/common.hpp"
#include "src/wrapper.cc"
#include "src/widgets/customwidget.hpp"

int main(int argc, char ** argv) {
    void * app = application(argc, argv);
    void * window = widget(nullptr);
    resize(window, 300, 300);
    set_title(window, "layout");

    void * layout = vertical_layout();
    layout_add_widget(layout, push_button("button1", nullptr));
    layout_add_widget(layout, push_button("button2", nullptr));
    layout_add_widget(layout, push_button("button3", nullptr));
    vertical_add_stretch(layout);
    set_layout(window, layout);

    show_widget(window);
    exec(app);
}