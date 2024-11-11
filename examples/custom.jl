using QtWrapper

function main()
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
end

main()