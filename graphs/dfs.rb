def dfs(vertex)
  vertex.discovered = true

  vertex.edges.each do |edge|
    other_vertex = edge.vertices.select do |test_vertex|
      test_vertex != vertex
    end

    dfs(other_vertex) unless other_vertex.discovered
  end
end
