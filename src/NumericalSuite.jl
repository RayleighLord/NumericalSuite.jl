module NumericalSuite

using UnPack

include("problem_def.jl")
include("timeschemes.jl")
include("timestep.jl")
include("interpolation.jl")
include("solution.jl")
include("solve.jl")

export MyODEProblem

export Euler, RK2

export solve

end
