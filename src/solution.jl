abstract type AbstractMyODESolution end

struct MyODESolution{uType, tType, P, A, IType} <: AbstractMyODESolution
    u::uType
    t::tType
    prob::P
    alg::A
    interp::IType
end

MyODESolution(u, t, prob, alg) = MyODESolution(u, t, prob, alg, interpolator(alg))

function build_solution(u, t, prob, alg)
    return MyODESolution(u, t, prob, alg)
end

function (sol::AbstractMyODESolution)(t::Number)
    return interpolate(t, sol.t, sol.u, sol.interp)
end
