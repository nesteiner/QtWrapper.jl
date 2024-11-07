mutable struct QApplication <: QObject
    pointer::Ptr{Nothing}

    function QApplication(argv::Vector{String})
        len = length(argv)

        f = dlsym(libqt_wrapper[], "application")
        pointer = ccall(f, Ptr{Nothing}, (Int, Vector{Cstring}), len, argv)
        result = new(pointer)

        finalizer(result) do obj 
            free(obj.pointer)
        end

        return result
    end
end

function exec!(app::QApplication)
    f = dlsym(libqt_wrapper[], "exec")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(app))
end