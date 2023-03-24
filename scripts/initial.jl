using NumericalSuite

f(u, p, t) = u

u0 = 1.0
tspan = (0.0, 1.0)

prob = MyODEProblem(f, u0, tspan)
sol = solve(prob, Euler(); dt = 0.01)

f(u, p, t) = [u[2], -u[1]]

u0 = [1.0, 0.0]
tspan = (0.0, 10.0)

prob = MyODEProblem(f, u0, tspan)
sol = solve(prob, Euler(); dt = 0.01)
