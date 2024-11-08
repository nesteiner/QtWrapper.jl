mutable struct QPushButton <: QtWidget
    pointer::Ptr{Nothing}

    function QPushButton(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "push_button")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(free, result)

        return result
    end
end
