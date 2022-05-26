module IgraphLayouts

using RCall
using Graphs: adjacency_matrix, is_directed, AbstractGraph
using LinearAlgebra: issymmetric
using GeometryBasics: Point

function fruchtermanreingold(g::AbstractGraph; seed=1234)
    adjmat = adjacency_matrix(g)
    mode = is_directed(g) ? "directed" : "undirected"
    
    R"""
    set.seed($seed)
    g = igraph::graph_from_adjacency_matrix($adjmat, mode=$mode)
    l = igraph::layout_with_fr(g)
    """
    l = @rget l
	return [Point(y, x) for (x, y) in eachrow(l)]
end

function fruchtermanreingold(adjmat::AbstractMatrix; seed=1234)
    mode = issymmetric(adjmat) ? "undirected" : "directed"
    
    R"""
    set.seed($seed)
    g = igraph::graph_from_adjacency_matrix($adjmat, mode=$mode, weighted=TRUE)
    l = igraph::layout_with_fr(g)
    """
    l = @rget l
	return [Point(y, x) for (x, y) in eachrow(l)]
end

function kamadakawai(g::AbstractGraph)
    adjmat = adjacency_matrix(g)
    mode = is_directed(g) ? "directed" : "undirected"
    
    R"""
    set.seed($seed)
    g = igraph::graph_from_adjacency_matrix($adjmat, mode=$mode)
    l = igraph::layout_with_kk(g)
    """
    l = @rget l
	return [Point(y, x) for (x, y) in eachrow(l)]
end

end
