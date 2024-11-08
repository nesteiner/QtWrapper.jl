module QtWrapper

import Base: resize!
export QApplication, QPushButton, QLabel, QWidget, QHBoxLayout, QVBoxLayout
export showWidget!, exec!
export setGeometry!, setTitle!, move!, resize!, setLayout!
export addLayout!, addStretch!, addWidget!

using Libdl

abstract type QObject end
abstract type QtWidget <: QObject end
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

include("qapplication.jl")
include("qlayout.jl")
include("qwidget.jl")
include("qlabel.jl")
include("qbutton.jl")


if false
    include("../examples/mywindow.jl")
end
end # module QtWrapper
