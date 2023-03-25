using Test
using NumericalSuite

@testset "Printing MyODEProblem" begin
    f(u, p, t) = u
    u0 = 1.0
    tspan = (0.0, 1.0)
    prob = MyODEProblem(f, u0, tspan)

    # Capture the output
    io = IOBuffer()
    show(io, MIME("text/plain"), prob)
    output = String(take!(io))

    # Compare the captured output with the expected output
    expected_output = """
    MyODEProblem with uType $(Float64) and tType $(Float64).
    tspan: (0.0, 1.0)
    u0: 1.0
    """
    @test output == expected_output
end

@testset "Printing MyODESolution 1D" begin
    f(u, p, t) = u
    u0 = 1.0
    tspan = (0.0, 1.0)
    prob = MyODEProblem(f, u0, tspan)

    # Capture the output
    io = IOBuffer()
    show(io, MIME("text/plain"), prob)
    output = String(take!(io))

    # Compare the captured output with the expected output
    expected_output = """
    MyODEProblem with uType $(Float64) and tType $(Float64).
    tspan: (0.0, 1.0)
    u0: 1.0
    """
    @test output == expected_output
end

@testset "Printing MyODESolution systems of eqs short" begin
    f(u, p, t) = [u[2], -u[1]]
    u0 = [1.0, 0.0]
    tspan = (0.0, 1.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 0.1)

    # Capture the output
    io = IOBuffer()
    show(io, MIME("text/plain"), sol)
    output = String(take!(io))

    # Compare the captured output with the expected output
    t_str = join(sol.t, "\n")
    u_str = join([string(sol.u[:, i]) for i in 1:length(sol.t)], "\n")
    expected_output = """
    t: $(length(sol.t))-element Vector{$(Float64)}
    $t_str
    u: $(length(sol.t))-rows $(Matrix{Float64})
    $u_str
    """
    @test output == expected_output
end

@testset "Printing MyODESolution systems of eqs long" begin
    f(u, p, t) = [u[2], -u[1]]
    u0 = [1.0, 0.0]
    tspan = (0.0, 10.0)
    prob = MyODEProblem(f, u0, tspan)
    sol = solve(prob, Euler(); Δt = 0.1)

    # Capture the output
    io = IOBuffer()
    show(io, MIME("text/plain"), sol)
    output = String(take!(io))

    # Compare the captured output with the expected output
    t_str_top = join(sol.t[1:10], "\n")
    t_str_bottom = join(sol.t[(end - 9):end], "\n")
    u_str_top = join([string(sol.u[:, i]) for i in 1:10], "\n")
    u_str_bottom = join([string(sol.u[:, i]) for i in (length(sol.t) - 9):length(sol.t)],
                        "\n")
    expected_output = """
    t: $(length(sol.t))-element Vector{$(Float64)}
    $t_str_top
    ⋮
    $t_str_bottom
    u: $(length(sol.t))-rows $(Matrix{Float64})
    $u_str_top
    ⋮
    $u_str_bottom
    """
    @test output == expected_output
end
