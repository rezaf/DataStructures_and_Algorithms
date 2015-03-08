require_relative 'bin_min_map'

class PriorityMap
  def initialize
    self.map = {}
    self.queue = BinMinMap.new
  end

  def [](key)
    return nil unless self.map.has_key?(key)
    self.map[key]
  end

  def []=(key, value)
    if self.map.has_key?(key)
      update(key, value)
    else
      insert(key, value)
    end
  end

  def count
    self.map.count
  end

  def empty?
    count == 0
  end

  def extract
    key = self.queue.extract
    value = self.map.delete(key)

    [key, value]
  end

  def has_key?(key)
    self.map.has_key?(key)
  end

  protected
  attr_accessor :map, :queue

  def insert(key, value)
    self.map[key] = value
    self.queue.push(key)

    nil
  end

  def update(key, value)
    raise 'Key does not exist!' unless self.map.has_key?(key)

    self.map[key] = value
    self.queue.reduce!(key)

    nil
  end
end
