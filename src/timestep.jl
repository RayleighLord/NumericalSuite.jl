function perform_step(f, uₙ, p, tₙ, dt, scheme::Euler)
    uₙ₊₁ = uₙ + dt * f(uₙ, p, tₙ)
    return uₙ₊₁
end
