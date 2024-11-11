module QtWrapper

import Base: resize!
using Libdl

abstract type QObject end
abstract type QtWidget <: QObject end
abstract type QAbstractButton <: QtWidget end
abstract type QLayout <: QObject end
abstract type QBoxLayout <: QLayout end

path = joinpath(@__DIR__, "../cpp/libqt_wrapper.so")
const libqt_wrapper = Ref{Ptr{Nothing}}()

function __init__()
    libqt_wrapper[] = dlopen(path)
end

function free(obj::QObject)
    f = dlsym(libqt_wrapper[], "free_qobject")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(obj))
end

ptr(app::QObject) = app.pointer
ptr(::Nothing) = C_NULL

macro pub(ex)
    __module__.eval(ex)
    #function
    if ex.head == :function || ex.head == :(=)
        if ex.args[1].head == :where
            :(export $(ex.args[1].args[1].args[1]))
        else
            :(export $(ex.args[1].args[1]))
        end
    elseif ex.head == :struct# struct
        if ex.args[2] isa Symbol
            :(export $(ex.args[2]))
        else
            :(export $(ex.args[2].args[1]))
        end
    else
        error("not a define of struct or function")
    end

end

include("qapplication.jl")
include("qlayout.jl")
include("qwidget.jl")
include("qlabel.jl")
include("qbutton.jl")
include("qlineedit.jl")
include("customwidget.jl")
# include("qcombobox.jl")

if false
    include("../examples/mywindow.jl")
    include("../examples/lineedit.jl")
    include("../examples/custom.jl")
end
end # module QtWrapper
