require_relative '../priority_map'
require_relative 'directed_graph'

def dijkstra(source)
  locked_in_paths = {}
  possible_paths = PriorityMap.new
  possible_paths[source] = { cost: 0, last_edge: nil }

  until possible_paths.empty?
    vertex, data = possible_paths.extract
    locked_in_paths[vertex] = data

    update_possible_paths(vertex, locked_in_paths, possible_paths)
  end

  locked_in_paths
end

def update_possible_paths(vertex, locked_in_paths, possible_paths)
  path_to_vertex_cost = locked_in_paths[vertex][:cost]

  vertex.out_edges.each do |edge|
    to_vertex = edge.to_vertex
    next if locked_in_paths.has_key?(to_vertex)

    extended_path_cost = path_to_vertex_cost + edge.cost
    next if possible_paths.has_key?(to_vertex) &&
            possible_paths[to_vertex][:cost] <= extended_path_cost

    possible_paths[to_vertex] = {
      cost: extended_path_cost,
      last_edge: edge
    }
  end
end
