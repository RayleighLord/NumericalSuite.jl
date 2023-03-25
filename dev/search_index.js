var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = NumericalSuite","category":"page"},{"location":"#NumericalSuite","page":"Home","title":"NumericalSuite","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for NumericalSuite.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [NumericalSuite]","category":"page"},{"location":"#NumericalSuite.Euler","page":"Home","title":"NumericalSuite.Euler","text":"Euler <: ODEAlgorithm\n\nThe classical Euler method for solving ordinary differential equations. It is a first-order method that discretizes the time derivative as a forward difference as follows:\n\nuₙ₊₁ = uₙ + Δt * f(uₙ, p, tₙ)\n\n\n\n\n\n","category":"type"},{"location":"#NumericalSuite.MyODEProblem","page":"Home","title":"NumericalSuite.MyODEProblem","text":"MyODEProblem{uType, tType, pType, F}\n\nDefines an Ordinary Differential Equation Problem.\n\nTo define an ODE problem, you need to provide the function f, the initial condition u0 and the time span tspan. The ODE problem is then of the form:\n\nu(t) = f(u(t) p t) u(t_0) = u_0\n\nwhere t_0 is the initial time and t_1 is the final time. The optional parameter p is a vector of parameters that can be passed to the function f.\n\nFields\n\n- `f`: Function that defines the ODE problem\n- `u0`: Initial condition\n- `tspan`: Time span\n- `p`: Vector of parameters\n\nExample Problem\n\nusing NumericalSuite\n\nf(u, p, t) = [u[2], t - u[1]]\n\nu0 = [1.0, 2.0]\ntspan = (0.0, 1.0)\n\nprob = MyODEProblem(f, u0, tspan)\n\n\n\n\n\n","category":"type"},{"location":"#NumericalSuite.MyODESolution","page":"Home","title":"NumericalSuite.MyODESolution","text":"MyODESolution{uType, tType, P, A, IType}\n\nRepresentation of an Ordinary Differential Equation solution defined by a MyODEProblem.\n\nThe solution is represented by a vector of times t and a matrix of solutions u. Additionally, an interpolator interp is provided to interpolate the solution at any point in the time span, with the same accuracy as the original solver.\n\nFields\n\n- `u`: Matrix of solutions\n- `t`: Vector of times\n- `prob`: MyODEProblem that defines the solution\n- `alg`: ODEAlgorithm used to solve the problem\n- `interp`: Interpolator used to interpolate the solution\n\nExample of use\n\nusing NumericalSuite\n\nf(u, p, t) = [u[2], t - u[1]]\n\nu0 = [1.0, 2.0]\ntspan = (0.0, 1.0)\n\nprob = MyODEProblem(f, u0, tspan)\nsol = solve(prob, Euler(), Δt = 0.1)\n\nsol(0.5)\n\nu = sol.u\nt = sol.t\n\n\n\n\n\n","category":"type"},{"location":"#NumericalSuite.RK2","page":"Home","title":"NumericalSuite.RK2","text":"RK2 <: ODEAlgorithm\n\nThe second-order Runge-Kutta method for solving ordinary differential equations. It is a second-order method that discretizes the time derivative as a midpoint method as follows:\n\nk₁ = f(uₙ, p, tₙ)\n\nk₂ = f(uₙ + Δt * k₁, p, tₙ + Δt)\n\nuₙ₊₁ = uₙ + Δt * (k₁ + k₂) / 2\n\n\n\n\n\n","category":"type"},{"location":"#NumericalSuite.solve-Tuple{MyODEProblem, NumericalSuite.ODEAlgorithm}","page":"Home","title":"NumericalSuite.solve","text":"solve(prob::MyODEProblem, alg::ODEAlgorithm; Δt = error(\"Δt not specified\"))\n\nSolve the MyODEProblem prob using the ODEAlgorithm alg and the time step Δt.\n\nExample of use\n\nusing NumericalSuite\n\nf(u, p, t) = [u[2], t - u[1]]\n\nu0 = [1.0, 2.0]\ntspan = (0.0, 1.0)\n\nprob = MyODEProblem(f, u0, tspan)\nsol = solve(prob, Euler(), Δt = 0.1)\n\n\n\n\n\n","category":"method"}]
}
