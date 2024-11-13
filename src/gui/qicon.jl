mutable struct QIcon
    pointer::Ptr{Nothing}

    function QIcon(pointer::Ptr{Nothing})
        result = new(pointer)
        finalizer(freeCommon, result)
        return result
    end

    function QIcon(path::String)
        f = dlsym(libqt_wrapper[], "icon_from_file")
        pointer = ccall(f, Ptr{Nothing}, (Cstring, ), path)

        result = new(pointer)
        finalizer(freeCommon, result)

        return result
    end
end