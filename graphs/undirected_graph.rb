class Vertex
  attr_reader :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end
end

class Edge
  attr_reader :vertex_v, :vertex_w, :cost

  def initialize(vertex_v, vertex_w, cost = 1)
    self.vertex_v = vertex_v
    self.vertex_w = vertex_w
    self.cost = cost

    vertex_v.edges << self
    vertex_w.edges << self
  end

  def destroy!
    self.vertex_v.edges.delete(self)
    self.vertex_v = nil
    self.vertex_w.edges.delete(self)
    self.vertex_w = nil
  end

  protected
  attr_writer :vertex_v, :vertex_w, :cost
end
