using NumericalSuite
using Test

@testset "Explicit Euler" begin include("explicit_euler.jl") end

@testset "Print Functions" begin include("print_test.jl") end

@testset "Exception checker" begin let err = nothing
    try
        f(u, p, t) = u
        u0 = 1.0
        tspan = (0.0, 1.0)
        prob = MyODEProblem(f, u0, tspan)
        sol = solve(prob, RK2(); Δt = 0.01)
    catch err
    end
    @test err isa ErrorException
end end

# TODO Test for different types of u0 and tspan
# TODO Test for different types of Arrays
