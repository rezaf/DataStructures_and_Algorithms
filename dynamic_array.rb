require_relative 'static_array'

class DynamicArray
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
  end

  def [](index)
    check_index(index)
    store[index]
  end

  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  def pop
    raise 'Index out of bounds' unless length > 0

    value = self[length - 1]
    self[length - 1] = nil
    self.length -= 1

    value
  end

  def push(value)
    resize! if length == capacity

    self.length += 1
    self[length - 1] = value

    nil
  end

  def shift
    raise 'Index out of bounds' unless length > 0

    value = self[0]
    (1...self.length).each { |i| self[i - 1] = self[i] }
    self[length - 1] = nil
    self.length -= 1

    value
  end

  def unshift(value)
    resize! if length == capacity

    self.length += 1
    (length - 2).downto(0) { |i| self[i + 1] = self[i] }
    self[0] = value

    nil
  end

  protected
  attr_accessor :store, :capacity
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index < length)
      raise 'Index out of bounds'
    end
  end

  def resize!
    new_capacity = capacity * 2
    new_store = Array.new(new_capacity)
    length.times { |i| new_store[i] = self[i] }

    self.capacity = new_capacity
    self.store = new_store
  end
end
