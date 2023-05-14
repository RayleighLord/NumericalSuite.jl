function perform_step(f, uₙ, p, tₙ, Δt, scheme::ODEAlgorithm)
    error("The temporal scheme $(scheme) is not implemented.")
end

function perform_step(f, uₙ, p, tₙ, Δt, ::Euler)
    uₙ₊₁ = uₙ + Δt * f(uₙ, p, tₙ)
    return uₙ₊₁
end
