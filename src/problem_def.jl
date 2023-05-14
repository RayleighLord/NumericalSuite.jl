abstract type AbstractMyODEProblem end

"""
    MyODEProblem{uType, tType, pType, F}

Defines an Ordinary Differential Equation Problem.

To define an ODE problem, you need to provide the function `f`, the initial condition `u0`
and the time span `tspan`. The ODE problem is then of the form:

```math
u'(t) = f(u(t), p, t), u(t_0) = u_0,
```

where `t_0` is the initial time and `t_1` is the final time. The optional parameter `p`
is a vector of parameters that can be passed to the function `f`.

# Fields
    - `f`: Function that defines the ODE problem
    - `u0`: Initial condition
    - `tspan`: Time span
    - `p`: Vector of parameters

# Example Problem

```julia
using NumericalSuite

f(u, p, t) = [u[2], t - u[1]]

u0 = [1.0, 2.0]
tspan = (0.0, 1.0)

prob = MyODEProblem(f, u0, tspan)
```
"""
struct MyODEProblem{uType, tType, pType, F} <: AbstractMyODEProblem
    f::F
    u0::uType
    tspan::tType
    p::pType
end

function MyODEProblem(f, u0, tspan)
    return MyODEProblem{typeof(u0), typeof(tspan), Nothing, typeof(f)}(f, u0, tspan,
                                                                       nothing)
end
