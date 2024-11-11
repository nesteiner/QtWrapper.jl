using QtWrapper

function main()
    app = QApplication(String[])
    window = QWidget()
    lineedit = QLineEdit("Hello world!", window)

    textChanged!(lineedit, (text::String) -> begin
        println("text changed: $text")
    end)

    showWidget!(window)
    exec!(app)
end

main()