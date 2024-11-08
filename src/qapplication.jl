single_app = nothing

mutable struct QApplication <: QObject
    pointer::Ptr{Nothing}

    function QApplication(argv::Vector{String})
        global single_app
        if !isnothing(single_app)
            finalize(single_app)
        end

        len = length(argv)

        f = dlsym(libqt_wrapper[], "application")
        pointer = ccall(f, Ptr{Nothing}, (Int, Vector{Cstring}), len, argv)
        single_app = new(pointer)

        finalizer(free, single_app)
        return single_app
    end
end

function exec!(app::QApplication)
    f = dlsym(libqt_wrapper[], "exec")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(app))
end