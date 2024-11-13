mutable struct QSize
    pointer::Ptr{Nothing}

    function QSize(pointer::Ptr{Nothing})
        result = new(pointer)
        finalizer(freeCommon, result)
        return result
    end

    function QSize(width::Int, height::Int)
        f = dlsym(libqt_wrapper[], "size")
        pointer = ccall(f, Ptr{Nothing}, (Cint, Cint), width, height)
        
        result = new(pointer)
        finalizer(freeCommon, result)

        return result
    end
    
end