require_relative '../bin_min_heap'
require_relative 'directed_graph'

def dijkstra(vertices, source)
  queue = BinaryMinHeap.new
  source.distance = 0

  vertices.each do |vertex|
    unless vertex == source
      vertex.distance = Float::INFINITY
      vertex.prev = nil
    end
    queue.push(vertex)
  end

  until queue.empty?
    vertex = queue.extract

    vertex.neighbors.each do |neighbor|
      alt = vertex.distance + length
    end
  end
end
