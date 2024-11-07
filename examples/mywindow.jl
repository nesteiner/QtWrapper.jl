using QtWrapper

function mywindow()::QWidget
    window = QWidget()
    resize!(window, 300, 300)
    setTitle!(window, "layout")

    layout = QVBoxLayout()
    addWidget!(layout, QPushButton("button1"))
    addWidget!(layout, QPushButton("button2"))
    addWidget!(layout, QPushButton("button3"))
    addStretch!(layout)

    setLayout!(window, layout)

    return window
end

function main()
    app = QApplication(String[])
    window = mywindow()
    showWidget!(window)

    exec!(app)
end

main()