mutable struct QHBoxLayout <: QBoxLayout
    pointer::Ptr{Nothing}

    function QHBoxLayout()
        f = dlsym(libqt_wrapper[], "horizontal_layout")
        pointer = ccall(f, Ptr{Nothing}, ())
        result = new(pointer)

        finalizer(free, result)

        return result
    end
end

mutable struct QVBoxLayout <: QBoxLayout
    pointer::Ptr{Nothing}

    function QVBoxLayout()
        f = dlsym(libqt_wrapper[], "vertical_layout")
        pointer = ccall(f, Ptr{Nothing}, ())
        result = new(pointer)

        finalizer(free, result)

        return result
    end
end

function addLayout!(layout::QBoxLayout, sublayout::QLayout)
    if layout isa QHBoxLayout
        f = dlsym(libqt_wrapper[], "horizontal_add_layout")
        ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(layout), ptr(sublayout))
    elseif layout isa QVBoxLayout
        f = dlsym(libqt_wrapper[], "vertial_add_layout")
        ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(layout), ptr(sublayout))
    else
        error("Unknown layout type")
    end
end

function addStretch!(layout::QBoxLayout, n::Int = 0)
    if layout isa QHBoxLayout
        f = dlsym(libqt_wrapper[], "horizontal_add_stretch")
        ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(layout), n)
    elseif layout isa QVBoxLayout
        f = dlsym(libqt_wrapper[], "vertical_add_stretch")
        ccall(f, Cvoid, (Ptr{Nothing}, Cint), ptr(layout), n)
    else
        error("Unknown layout type")
    end
end

function addWidget!(layout::QLayout, widget::QtWidget)
    f = dlsym(libqt_wrapper[], "layout_add_widget")
    ccall(f, Cvoid, (Ptr{Nothing}, Ptr{Nothing}), ptr(layout), ptr(widget))
end