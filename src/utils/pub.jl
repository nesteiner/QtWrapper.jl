#= 
example 1:
function f(x::T)::Int where T
    return 1
end

example 2:
function f(x::T) where T
    reurn 1
end

common condition: 
expr.head == :function && 
expr.args[1].head == :where

special condition:
example 1:
expr.args[1].args[1].head == :(::)

example 2:
expr.args[1].args[1].head == :(call)
=#
function fullFunctionWithGeneric(expr::Expr)::Symbol
    return if expr.args[1].args[1].head == :(::)
        expr.args[1].args[1].args[1].args[1]
    elseif expr.args[1].args[1].head == :(call)
        expr.args[1].args[1].args[1]
    else
        error("unhandled case")
    end
end

#= 
example 1:
function f(x::Int)::Int
    return 1
end

example 2:
function f(x::Int)
    return 1
end

common condition:
expr.head == :function 

special condition:
example 1:
expr.args[1].head == :(::)

example 2:
expr.args[1].head == :call
=#
function fullFunctionWithoutGeneric(expr::Expr)::Symbol
    return if expr.args[1].head == :(::)
        expr.args[1].args[1].args[1]
    elseif expr.args[1].head == :call
        expr.args[1].args[1]
    else
        error("unhandled case")
    end
end

#= 
example 1:
f(x::T)::Int where T = 1

example 2:
f(x::T) where T = 1

example 3:
f(x::T) where T = begin
    return 1
end

common condition:
expr.head == :(=) && expr.args[1].args[1].head == :call

special condition:
example 1:
expr.args[1].head == :(::) &&
expr.args[1].args[2].head == :where

example 2:
expr.args[1].head == :where

example 3:
expr.args[1].head == :where && 
expr.args[1].args[1].head == :call
=#
function shortFunctionWithGeneric(expr::Expr)::Symbol
    return expr.args[1].args[1].args[1]
end

#= 
example 1:
f(x::Int)::Int = 1

example 2:
f(x::Int) = 1

example 3:
f(x::Int) = begin 
    return 1
end

condition:

common condition:
expr.head == :(=) && (expr.args[1].head == :call || expr.args[1].args[1].head == :call)

special condition:
example 1:
expr.args[1].head == :(::)

example 2:
expr.args[1].head == :call

example 3:
expr.args[1].head == :call
=#
function shortFunctionWithoutGeneric(expr::Expr)::Symbol
    return if expr.args[1].head == :(::) 
        expr.args[1].args[1].args[1]
    elseif expr.args[1].head == :call
        expr.args[1].args[1]
    else
        error("unhandled case")
    end
end

function pubname(expr::Expr)::Symbol
    # process function
    return if expr.head == :function 
        if expr.args[1].head == :where
            fullFunctionWithGeneric(expr)
        else
            fullFunctionWithoutGeneric(expr)
        end
    #process short function
    elseif expr.head == :(=) && expr.args[1].args[1].head == :call
        if expr.args[1].head == :where || expr.args[1].args[2].head == :where
            shortFunctionWithGeneric(expr)
        else
            shortFunctionWithoutGeneric(expr)
        end
    elseif expr.head == :struct # process struct
        if expr.args[2] isa Symbol
            expr.args[2]
        else
            expr.args[2].args[1]
        end
    else
        error("unhandled case")
    end
end

macro pub(expr)
    __module__.eval(expr)
    name = pubname(expr)

    :(export $name)
end