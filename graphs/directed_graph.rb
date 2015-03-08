class Vertex
  attr_reader :value, :in_edges, :out_edges, :discovered

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
    @discovered = false
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    self.from_vertex = from_vertex
    self.to_vertex = to_vertex
    self.cost = cost

    from_vertex.out_edges << self
    to_vertex.in_edges << self
  end

  def destroy!
    self.from_vertex.out_edges.delete(self)
    self.from_vertex = nil
    self.to_vertex.in_edges.delete(self)
    self.to_vertex = nil
  end

  protected
  attr_writer :from_vertex, :to_vertex, :cost
end
