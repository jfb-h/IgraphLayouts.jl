# IgraphLayouts

This package is a simple Julia wrapper for some [Igraph](https://igraph.org/r/) graph layouting functions which utilizes the [RCall.jl](https://github.com/JuliaInterop/RCall.jl) package to bridge to `R`. Accordingly, you need to have both `R` and the `igraph` R package installed on your system.

Here's a simple example for use with `Graphs.jl` and `GraphMakie.jl`:

```julia
using Graphs, GraphMakie, IgraphLayouts

g = erdos_renyi(10, 20)
graphplot(g, layout=IgraphLayouts.fruchtermanreingold)
```
