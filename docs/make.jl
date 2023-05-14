using NumericalSuite
using Documenter

DocMeta.setdocmeta!(NumericalSuite, :DocTestSetup, :(using NumericalSuite); recursive=true)

makedocs(;
    modules=[NumericalSuite],
    authors="Javier González Monge",
    repo="https://github.com/RayleighLord/NumericalSuite.jl/blob/{commit}{path}#{line}",
    sitename="NumericalSuite.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://RayleighLord.github.io/NumericalSuite.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/RayleighLord/NumericalSuite.jl",
    devbranch="main",
)
