@pub mutable struct CustomWidget <: QtWidget
    pointer::Ptr{Nothing}

    function CustomWidget(parent::Union{QtWidget, Nothing} = nothing)
        f = dlsym(libqt_wrapper[], "custom_widget")
        pointer = ccall(f, Ptr{Nothing}, (Ptr{Nothing}, ), ptr(parent))
        result = new(pointer)

        finalizer(freeQObject, result)

        return result 
    end
end

@pub function registerSlot!(widget::CustomWidget, ::Type{T}, name::String, slot::Function) where T
    f = dlsym(libqt_wrapper[], "custom_register_slot")
    nextCallback(data::Ptr{Nothing}) = begin
        dataptr = convert(Ptr{T}, data)
        data = unsafe_load(dataptr)
        slot(data)

        nothing
    end

    ccall(f, Cvoid, 
        (Ptr{Nothing}, Cstring, Ptr{Nothing}), 
        ptr(widget), 
        name, 
        @cfunction($nextCallback, Cvoid, (Ptr{Nothing},)))
        
end

@pub function emitSignal(widget::QtWidget, signal::String, arg::T) where T
    f = dlsym(libqt_wrapper[], "custom_emit_signal")
    data = pointer([arg])
    ccall(f, Cvoid, (Ptr{Nothing}, Cstring, Ptr{Nothing}), ptr(widget), signal, data)
end