abstract type ODEAlgorithm end

struct Euler <: ODEAlgorithm end

struct RK2 <: ODEAlgorithm end
