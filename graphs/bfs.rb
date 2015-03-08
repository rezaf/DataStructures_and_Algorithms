def bfs(vertex)
  queue = [vertex]
  vertex.discovered = true

  until queue.empty?
    vertex = queue.shift

    vertex.edges.each do |edge|
      other_vertex = edge.vertices.select do |test_vertex|
        test_vertex != vertex
      end

      unless other_vertex.discovered
        queue << other_vertex
        other_vertex.discovered = true
      end
    end
  end
end
