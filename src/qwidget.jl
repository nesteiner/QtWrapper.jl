@pub mutable struct QWidget <: QtWidget
    pointer::Ptr{Nothing}

    function QWidget(parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "widget")
        pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(parent))
        result = new(pointer)

        finalizer(free, result)

        return result
    end
end

@pub function showWidget!(widget::QtWidget)
    f = dlsym(libqt_wrapper[], "show_widget")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(widget))
end

@pub function resize!(widget::T, width::Int, height::Int) where T <: QtWidget
    f = dlsym(libqt_wrapper[], "resize")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint), ptr(widget), width, height)
end

@pub function setTitle!(widget::T, title::String) where T <: QtWidget
    f = dlsym(libqt_wrapper[], "set_title")
    ccall(f, Cvoid, (Ptr{Nothing}, Cstring), ptr(widget), title)
end

@pub function move!(widget::T, x::Int, y::Int) where T <: QtWidget
    f = dlsym(libqt_wrapper[], "move")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint), ptr(widget), x, y)
end

@pub function setGeometry!(widget::T; x::Int, y::Int, width::Int, height::Int) where T <: QtWidget
    f = dlsym(libqt_wrapper[], "set_geometry")
    ccall(f, Cvoid, (Ptr{Nothing}, Cint, Cint, Cint, Cint), ptr(widget), x, y, width, height)
end

@pub function setLayout!(widget::QtWidget, layout::QLayout)
    f = dlsym(libqt_wrapper[], "set_layout")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(widget), ptr(layout))
end