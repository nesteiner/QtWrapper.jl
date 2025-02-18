@pub mutable struct QApplication <: QObject
    pointer::Ptr{Nothing}

    function QApplication(argv::Vector{String})
        len = length(argv)
        f = dlsym(libqt_wrapper[], "application")
        pointer = ccall(f, Ptr{Nothing}, (Int, Vector{Cstring}), len, argv)
        finalizer(freeQObject, single_app)
        return new(pointer)
    end
end

@pub function exec!(app::QApplication)
    f = dlsym(libqt_wrapper[], "exec")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(app))
end