#include "../common.hpp"

void * label(const char * text, void * parent) {
    require_non_null(text, "label, text is null");

    return new QLabel(text, static_cast<QWidget *>(parent));
}

/* using Qt::Alignment;
Alignment lable_alignment(void * pwidget) {
    QLabel * label = static_cast<QLabel *>(pwidget);
    return label->alignment();
}

void label_set_alignment(void * pwidget, Alignment alignment) {
    QLabel * label = static_cast<QLabel *>(pwidget);
    label->setAlignment(alignment);
}
 */
void * label_buddy(void * pwidget) {
    require_non_null(pwidget, "label_buddy, pwidget is null");

    return static_cast<QLabel *>(pwidget)->buddy();
}

void label_set_buddy(void * pwidget, void * buddy) {
    require_non_null(pwidget, "label_set_buddy, pwidget is null");
    require_non_null(buddy, "label_set_buddy, buddy is null");

    static_cast<QLabel *>(pwidget)->setBuddy(static_cast<QWidget *>(buddy));
}

void label_clear(void * pwidget) {
    require_non_null(pwidget, "label_clear, pwidget is null");

    static_cast<QLabel *>(pwidget)->clear();
}

bool label_has_scaled_contents(void * pwidget) {
    require_non_null(pwidget, "label_has_scaled_contents, pwidget is null");

    return static_cast<QLabel *>(pwidget)->hasScaledContents();
}


