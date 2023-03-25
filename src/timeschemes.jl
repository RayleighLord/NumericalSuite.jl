abstract type ODEAlgorithm end

"""
    Euler <: ODEAlgorithm

The classical Euler method for solving ordinary differential equations. It is a first-order
method that discretizes the time derivative as a forward difference as follows:
```
uₙ₊₁ = uₙ + Δt * f(uₙ, p, tₙ)
```
"""
struct Euler <: ODEAlgorithm end

"""
    RK2 <: ODEAlgorithm

The second-order Runge-Kutta method for solving ordinary differential equations. It is a
second-order method that discretizes the time derivative as a midpoint method as follows:
```
k₁ = f(uₙ, p, tₙ)

k₂ = f(uₙ + Δt * k₁, p, tₙ + Δt)

uₙ₊₁ = uₙ + Δt * (k₁ + k₂) / 2
```
"""
struct RK2 <: ODEAlgorithm end
