"""
    solve(prob::MyODEProblem, alg::ODEAlgorithm; Δt = error("Δt not specified"))

Solve the MyODEProblem `prob` using the ODEAlgorithm `alg` and the time step `Δt`.

# Example of use

```julia
using NumericalSuite

f(u, p, t) = [u[2], t - u[1]]

u0 = [1.0, 2.0]
tspan = (0.0, 1.0)

prob = MyODEProblem(f, u0, tspan)
sol = solve(prob, Euler(), Δt = 0.1)
```
"""
function solve(prob::MyODEProblem, alg::ODEAlgorithm; Δt = error("Δt not specified"))
    f, u0, tspan, p = prob.f, prob.u0, prob.tspan, prob.p

    t0, tf = tspan
    m = length(u0)

    N = ceil(Int, (tf - t0) / Δt)
    t = [t0 + i * Δt for i in 0:N]

    u = Array{eltype(u0)}(undef, m, N + 1)
    u[:, 1] .= u0

    if m == 1
        for n in 1:N
            uₙ, tₙ = u[n], t[n]
            u[n + 1] = perform_step(f, uₙ, p, tₙ, Δt, alg)
        end
    else
        for n in 1:N
            uₙ, tₙ = u[:, n], t[n]
            u[:, n + 1] = perform_step(f, uₙ, p, tₙ, Δt, alg)
        end
    end

    sol = build_solution(u, t, prob, alg)

    return sol
end
