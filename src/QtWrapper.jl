module QtWrapper

import Base: resize!
using Libdl

abstract type QObject end
abstract type QtWidget <: QObject end
abstract type QFrame <: QtWidget end
abstract type QAbstractButton <: QtWidget end
abstract type QLayout <: QObject end
abstract type QBoxLayout <: QLayout end

path = joinpath(@__DIR__, "../cpp/libqt_wrapper.so")
const libqt_wrapper = Ref{Ptr{Nothing}}()

function __init__()
    libqt_wrapper[] = dlopen(path)
end

function freeQObject(obj::QObject)
    f = dlsym(libqt_wrapper[], "free_qobject")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(obj))
end

function freeCommon(obj)
    f = dlsym(libqt_wrapper[], "free_common")
    ccall(f, Cvoid, (Ptr{Nothing}, ), ptr(obj))
end

ptr(obj) = obj.pointer
ptr(obj::QObject) = obj.pointer
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
# include core
include("core/enum.jl")
include("core/qsize.jl")

# include gui
include("gui/qicon.jl")
include("gui/qkeysequence.jl")
# include widgets

include("widgets/qlayout.jl")
include("widgets/qwidget.jl")
include("widgets/qlabel.jl")
include("widgets/qbutton.jl")
include("widgets/qlineedit.jl")
include("widgets/customwidget.jl")
# include("qcombobox.jl")

if false
    include("../examples/mywindow.jl")
    include("../examples/lineedit.jl")
    include("../examples/custom.jl")
end
end # module QtWrapper
