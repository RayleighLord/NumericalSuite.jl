using NumericalSuite
using Test

@testset "Explicit Euler" begin include("explicit_euler.jl") end

@testset "Exception checker" begin let err = nothing
    try
        f(u, p, t) = u
        u0 = 1.0
        tspan = (0.0, 1.0)
        prob = MyODEProblem(f, u0, tspan)
        sol = solve(prob, RK2(); dt = 0.01)
    catch err
    end
    @test err isa ErrorException
end end
