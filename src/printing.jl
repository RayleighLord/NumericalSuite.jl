function Base.show(io::IO, ::MIME"text/plain", prob::AbstractMyODEProblem)
    u0, tspan = prob.u0, prob.tspan
    println(io, "MyODEProblem with uType $(typeof(u0)) and tType $(typeof(tspan[1])).")
    println(io, "tspan: $(tspan)")
    println(io, "u0: $(u0)")
end

function Base.show(io::IO, ::MIME"text/plain", sol::AbstractMyODESolution)
    u, t = sol.u, sol.t
    if length(t) < 30
        println(io, "t: $(length(t))-element Vector{$(typeof(t[1]))}")
        for i in eachindex(t)
            println(io, "$(t[i])")
        end
        println(io, "u: $(length(t))-rows $(typeof(u))")
        for i in 1:length(t)
            println(io, "$(u[:, i])")
        end
    else
        println(io, "t: $(length(t))-element Vector{$(typeof(t[1]))}")
        for i in 1:10
            println(io, "$(t[i])")
        end
        println(io, "⋮")
        for i in (length(t) - 9):length(t)
            println(io, "$(t[i])")
        end
        println(io, "u: $(length(t))-rows $(typeof(u))")
        for i in 1:10
            println(io, "$(u[:, i])")
        end
        println(io, "⋮")
        for i in (length(t) - 9):length(t)
            println(io, "$(u[:, i])")
        end
    end
end
