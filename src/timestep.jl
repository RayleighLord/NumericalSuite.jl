function perform_step(f, uₙ, p, tₙ, dt, scheme::ODEAlgorithm)
    error("The temporal scheme $(scheme) is not implemented.")
end

function perform_step(f, uₙ, p, tₙ, dt, ::Euler)
    uₙ₊₁ = uₙ + dt * f(uₙ, p, tₙ)
    return uₙ₊₁
end
