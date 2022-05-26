using IgraphLayouts
using Test
using Graphs
using GeometryBasics

@testset "IgraphLayouts.jl" begin
    g = Graphs.erdos_renyi(10, 20)
    l = IgraphLayouts.fruchtermanreingold(g)
    @test l isa Vector{<:Point}
    @test length(l) == nv(g)
end
