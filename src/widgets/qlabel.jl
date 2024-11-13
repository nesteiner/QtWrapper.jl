@pub mutable struct QLabel <: QFrame
    pointer::Ptr{Nothing}

    function QLabel(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "label")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result
    end
end