#include "../common.h"

void * label(const char * text, void * parent) {
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
    return static_cast<QLabel *>(pwidget)->buddy();
}

void label_set_buddy(void * pwidget, void * buddy) {
    static_cast<QLabel *>(pwidget)->setBuddy(static_cast<QWidget *>(buddy));
}

void label_clear(void * pwidget) {
    static_cast<QLabel *>(pwidget)->clear();
}

bool label_has_scaled_contents(void * pwidget) {
    return static_cast<QLabel *>(pwidget)->hasScaledContents();
}


