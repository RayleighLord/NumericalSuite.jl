abstract type AbstractMyODESolution end

struct MyODESolution{uType, tType, P, A, IType} <: AbstractMyODESolution
    u::uType
    t::tType
    prob::P
    alg::A
    interp::IType
end

function MyODESolution(u, t, prob, alg)
    interp = interpolator(alg)
    return MyODESolution{typeof(u), typeof(t), typeof(prob),
                         typeof(alg), typeof(interp)}(u, t, prob, alg, interp)
end

function build_solution(u, t, prob, alg)
    return MyODESolution(u, t, prob, alg)
end

function (sol::AbstractMyODESolution)(t::Number)
    return interpolate(t, sol.t, sol.u, sol.interp)
end
