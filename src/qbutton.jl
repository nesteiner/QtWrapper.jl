@pub mutable struct QPushButton <: QAbstractButton
    pointer::Ptr{Nothing}

    function QPushButton(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "push_button")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(free, result)

        return result
    end
end

@pub mutable struct QRadioButton <: QAbstractButton
    pointer::Ptr{Nothing}
    
    function QRadioButton(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "radio_button")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(free, result)

        return result
    end
end

@pub mutable struct QCheckbBox <: QAbstractButton
    pointer::Ptr{Nothing}
    
    function QCheckbBox(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "checkbox")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(free, result)

        return result
    end
end

@pub function clicked!(button::QAbstractButton, callback::Function)
    f = dlsym(libqt_wrapper[], "button_connect_clicked")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, (Bool,)))
end

@pub function resetClicked!(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_disconnect_clicked_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function pressed!(button::QAbstractButton, callback::Function)
    f = dlsym(libqt_wrapper[], "button_connect_pressed")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, ()))
end

@pub function resetPressed!(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_disconnect_pressed_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function released!(button::QAbstractButton, callback::Function)
    f = dlsym(libqt_wrapper[], "button_connect_released")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, ()))
end

@pub function resetReleased!(button::QAbstractButton)
    f = dlsym(libqt_wrapper[], "button_disconnect_released_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function toggled!(button::QRadioButton, callback::Function)
    f = dlsym(libqt_wrapper[], "radiobutton_connect_toggled")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, (Bool,)))
end

@pub function resetToggled!(button::QRadioButton)
    f = dlsym(libqt_wrapper[], "radiobutton_disconnect_toggled_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end

@pub function toggled!(button::QCheckbBox, callback::Function)
    f = dlsym(libqt_wrapper[], "checkbox_connect_toggled")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(button), @cfunction($callback, Cvoid, (Bool,)))
end

@pub function resetToggled!(button::QCheckbBox)
    f = dlsym(libqt_wrapper[], "checkbox_disconnect_toggled_all")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(button))
end