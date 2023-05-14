abstract type AbstractMyODESolution end

"""
    MyODESolution{uType, tType, P, A, IType}

Representation of an Ordinary Differential Equation solution defined by a MyODEProblem.

The solution is represented by a vector of times `t` and a matrix of solutions `u`.
Additionally, an interpolator `interp` is provided to interpolate the solution at any
point in the time span, with the same accuracy as the original solver.

# Fields
    - `u`: Matrix of solutions
    - `t`: Vector of times
    - `prob`: MyODEProblem that defines the solution
    - `alg`: ODEAlgorithm used to solve the problem
    - `interp`: Interpolator used to interpolate the solution

# Example of use

```julia
using NumericalSuite

f(u, p, t) = [u[2], t - u[1]]

u0 = [1.0, 2.0]
tspan = (0.0, 1.0)

prob = MyODEProblem(f, u0, tspan)
sol = solve(prob, Euler(), Δt = 0.1)

sol(0.5)

u = sol.u
t = sol.t
```
"""
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
