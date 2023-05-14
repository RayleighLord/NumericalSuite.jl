module NumericalSuite

include("problem_def.jl")
include("timeschemes.jl")
include("timestep.jl")
include("interpolation.jl")
include("solution.jl")
include("printing.jl")
include("solve.jl")

export MyODEProblem, MyODESolution

export Euler, RK2

export solve

end
