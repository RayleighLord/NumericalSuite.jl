abstract type AbstractMyODEProblem end

struct MyODEProblem{uType, tType, pType, F} <: AbstractMyODEProblem
    f::F
    u0::uType
    tspan::tType
    p::pType
end

function MyODEProblem(f, u0, tspan, p = nothing)
    return MyODEProblem{typeof(u0), typeof(tspan), Nothing, typeof(f)}(f, u0, tspan, p)
end
