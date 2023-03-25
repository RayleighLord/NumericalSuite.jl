using Test
using NumericalSuite

@testset "Exponential ODE numerical" begin
    f(u, p, t) = u
    u0 = 1.0
    tspan = (0.0, 1.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 0.01)

    @test sol.u[2] == 1.01
    @test sol.u[3] == 1.0201
    @test sol.u[4] == 1.030301
end

@testset "Exponential ODE stringent Δt" begin
    f(u, p, t) = u
    u0 = 1.0
    tspan = (0.0, 1.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 1e-7)

    @test sol(0.2) ≈ exp(0.2)
end

@testset "Logistic map" begin
    f(u, p, t) = 2u * (1 - u)
    u0 = 1 / 5
    tspan = (10.0, 11.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 0.2)

    @test sol.u[2]≈0.2640 atol=1e-3
    @test sol.u[3]≈0.3417 atol=1e-3
    @test sol.u[4]≈0.4317 atol=1e-3
    @test sol.u[5]≈0.5298 atol=1e-3
    @test sol.u[6]≈0.6295 atol=1e-3
end

@testset "ODE System" begin
    f(u, p, t) = [u[2], t - u[1]]
    u0 = [1.0, 2.0]
    tspan = (0.0, 1.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 0.1)

    @test sol.u[1, 2]≈1.2 atol=1e-3
    @test sol.u[2, 2]≈1.9 atol=1e-3
    @test sol.u[1, 3]≈1.39 atol=1e-3
    @test sol.u[2, 3]≈1.79 atol=1e-3
end

@testset "Harmonic Oscillator" begin
    f(u, p, t) = [u[2], -u[1]]
    u0 = [1.0, 0.0]
    tspan = (0.0, 10.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 1e-5)

    @test sol.u[1, 2]≈0.9999 atol=1e-3
    @test sol(2π)[1]≈1.0 atol=1e-3
    @test sol(2π)[2]≈0.0 atol=1e-3
end

@testset "Interpolator error" begin
    f(u, p, t) = u
    u0 = 1.0
    tspan = (0.0, 1.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 0.01)

    msg = "The value of t must be in the tspan $(tspan[1]) <= t <= $(tspan[end])."

    @test_throws ErrorException(msg) sol(1.5)
end
