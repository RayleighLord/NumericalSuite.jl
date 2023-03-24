using NumericalSuite

f(u, p, t) = u

u0 = 1.0
tspan = (0.0, 1.0)

prob = MyODEProblem(f, u0, tspan)
sol = solve(prob, Euler(); dt = 0.01)
# sol = solve(prob, RK2(); dt = 0.1)
