mutable struct QLabel <: QtWidget
    pointer::Ptr{Nothing}

    function QLabel(text::String, parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "label")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, Ptr{Nothing}), text, ptr(parent))
        result = new(pointer)

        finalizer(result) do obj
            free(obj.pointer)
            Libc.free(string)
        end

        return result
    end
end