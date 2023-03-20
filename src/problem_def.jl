abstract type AbstractMyODEProblem end

struct MyODEProblem{uType, tType, pType, F} <: AbstractMyODEProblem
    f::F
    u0::uType
    tspan::tType
    p::pType
end

MyODEProblem(f, u0, tspan, p = nothing) = MyODEProblem(f, u0, tspan, p)
