# [Developing] QtWrapper.jl
最近闲的没事闲，想把 Qt 的 C++ 语言接口给封装起来，方便 Julia 调用
大家不要看虽然代码这么多，但其实很简单，

1. 用 `void *` 指针梭哈
2. 构造一个 `mutable struct` 来包装这个指针，并注册其 `finalizer` 回调函数

那枚举也是 `void *` 指针梭哈吗？不是的，这个时候必须要在 Julia 中重新定义一遍枚举，还好有GPT存在，工作量少了很多

这个项目的亮点几乎没有，就是重复的调用C暴露出来的API，这个项目的接口参考的是 **PyQt6** ，在编写接口的时候，其实做的都是大量重复工作，如果你有精力的话，欢迎PR，现在点 star 就是老粉了，另外第一次写大型项目的文档，有点吃力，慢慢会变好的

对于信号和槽，有个重要的概念，那就是自定义的槽和信号函数，由于无法在C中使用类，所以这里另辟蹊径，我们这样做

```c++
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
```

然后是暴露的C接口
```c
void * custom_widget(void * parent) {
    return new CustomWidget(static_cast<QWidget*>(parent));
}

void custom_register_slot(void * pwidget, const char * signal_name, void (*slot)(void *)) {
    static_cast<CustomWidget*>(pwidget) -> register_slot(signal_name, slot);
}

void custom_emit_signal(void * pwidget, const char * signal_name, void * user_data) {
    static_cast<CustomWidget*>(pwidget) -> emit_custom_signal(signal_name, user_data);
}
```

这样我们就可以通过字符串来查找到对应的信号，然后 emit 槽函数来激活信号
附上这个类的实现

```c++
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
```

我们这样调用自定义槽和信号

```julia
app = QApplication(String[])
customWidget = CustomWidget()

registerSlot!(customWidget, String, "slot1", (value::String) -> begin
    println("slot1: $value")
end)

button = QPushButton("Click me!", customWidget)
clicked!(button, (_) -> begin
    emitSignal(customWidget, "signal1", "Hello world!")
end)

showWidget!(customWidget)
exec!(app)
```

## 待开发的组件

1. QComboBox
2. QLineEdit
3. QLabel
4. QLayout
5. QComboBox
6. QTreeView
7. QListWidget
8. QTableView
9. QDialog
10. QMainWindow
11. QMenu
12. QMenuBar
13. QStatusBar
14. QToolBar
and more...

## 正在开发的组件

### QAbstractButton

#### 构造函数

```julia
QPushButton(text::String, parent::QWidget)
QRadioButton(text::String, parent::QWidget)
QCheckBox(text::String, parent::QWidget)
```

#### 槽

```julia
click(button::QAbstractButton),
animateClick(button::QAbstractButton),
checked!(button::QAbstractButton, value::Bool),
toggle(button::QAbstractButton),
iconSize!(button::QAbstractButton, width::Int, height::Int)
```

#### 信号

Julia 的函数类型声明只有一个 `Function` ，没有接收参数和返回类型声明，这真是让人难受啊，下个提交中我将把函数说明写在其注释中

```julia
clicked!(button::QAbstractButton, callback::Function)
resetClicked!(button::QAbstractButton)
pressed!(button::QAbstractButton, callback::Function)
resetPressed!(button::QAbstractButton)
released!(button::QAbstractButton, callback::Function)
resetReleased!(button::QAbstractButton)
toggled!(button::QRadioButton, callback::Function)
resetToggled!(button::QRadioButton)
toggled!(button::QCheckBox, callback::Function)
resetToggled!(button::QCheckBox)
```

#### 成员方法

```julia
autoExclusive(button::QAbstractButton)::Bool,
autoExclusive!(button::QAbstractButton, value::Bool),
autoRepeat(button::QAbstractButton)::Bool,
autoRepeat!(button::QAbstractButton, value::Bool),
autoRepeatDelay(button::QAbstractButton)::Int,
autoRepeatDelay!(button::QAbstractButton, value::Int),
autoRepeatInterval(button::QAbstractButton)::Int,
autoRepeatInterval!(button::QAbstractButton, value::Int),
checkable(button::QAbstractButton)::Bool,
checkable!(button::QAbstractButton, value::Bool),
down(button::QAbstractButton)::Bool,
down!(button::QAbstractButton, value::Bool),
icon(button::QAbstractButton)::QIcon,
icon!(button::QAbstractButton, icon::QIcon),
iconSize(button::QAbstractButton)::QSize,
shortcut(button::QAbstractButton)::QKeySequence,
shortcut!(button::QAbstractButton, shortcut::QKeySequence),
text(button::QAbstractButton)::String,
text!(button::QAbstractButton, text::String),
```