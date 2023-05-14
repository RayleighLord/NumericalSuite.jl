using NumericalSuite

f(u, p, t) = u
u0 = 1.0
tspan = (0.0, 1.0)

prob = MyODEProblem(f, u0, tspan)
sol = solve(prob, Euler(); Δt = 0.01)
