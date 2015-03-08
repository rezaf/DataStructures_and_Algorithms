class Vertex
  attr_reader :value, :edges, :discovered

  def initialize(value)
    @value = value
    @edges = []
    @discovered = false
  end
end

class Edge
  attr_reader :vertices

  def initialize(vertices)
    self.vertices = vertices
    self.vertices.each { |vertex| vertex.edges << self }
  end

  def destroy!
    self.vertices.each do |vertex|
      vertex.edges.delete(self)
      vertex = nil
    end
  end

  protected
  attr_writer :vertices
end
