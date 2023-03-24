abstract type AbstractInterpolator end

struct FirstOrderInterpolator <: AbstractInterpolator end

function interpolator(::ODEAlgorithm) end

interpolator(::Euler) = FirstOrderInterpolator()

function interpolate(t, ts, us, ::FirstOrderInterpolator)
    for i in eachindex(ts)
        if ts[i] <= t <= ts[i + 1]
            # Compute the slope and intercept of the line between the two points
            m = (us[i + 1] - us[i]) / (ts[i + 1] - ts[i])
            n = us[i] - m * ts[i]

            # Perform linear interpolation
            u = m * t + n
            return u
        end
    end
    error("The value of t must be in the tspan $(ts[1]) <= t <= $(ts[end]).")
end
