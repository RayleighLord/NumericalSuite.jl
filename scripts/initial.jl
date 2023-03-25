using NumericalSuite

f(u, p, t) = [u[2], t - u[1]]

u0 = [1.0, 2.0]
tspan = (0.0, 1.0)

prob = MyODEProblem(f, u0, tspan)
sol = solve(prob, Euler(); dt = 0.01)
