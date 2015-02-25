class StaticArray
  def initialize(length)
    self.store = Array.new(length, nil)
  end

  def [](index)
    store[index]
  end

  def []=(index, value)
    store[index] = value
  end
end
