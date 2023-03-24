function solve(prob::MyODEProblem, alg::ODEAlgorithm; dt = error("dt not specified"))
    @unpack f, u0, tspan, p = prob

    t0, tf = tspan
    m = length(u0)

    N = ceil(Int, (tf - t0) / dt)
    t = [t0 + i * dt for i in 0:N]

    u = Array{eltype(u0)}(undef, m, N + 1)
    u[:, 1] .= u0

    if m == 1
        for n in 1:N
            uₙ, tₙ = u[n], t[n]
            u[n + 1] = perform_step(f, uₙ, p, tₙ, dt, alg)
        end
    else
        for n in 1:N
            uₙ, tₙ = u[:, n], t[n]
            u[:, n + 1] = perform_step(f, uₙ, p, tₙ, dt, alg)
        end
    end

    sol = build_solution(u, t, prob, alg)

    return sol
end
