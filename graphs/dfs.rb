def dfs(vertex)
  vertex.discovered = true

  vertex.edges.each do |edge|
    other_vertex = edge.vertices.select { |v| v != vertex }

    dfs(other_vertex) unless other_vertex.discovered
  end
end
