class IntHashSet
  DEFAULT_SIZE = 8
  MAX_LOAD = 1.00

  attr_reader :count

  def initialize
    self.buckets = Array.new(DEFAULT_SIZE) { [] }
    self.count = 0
  end

  def include?(value)
    bucket_for(value).include?(value)
  end

  def insert(value)
    return false if include?(value)

    self.resize! if (count + 1).fdiv(buckets.length) > MAX_LOAD

    bucket_for(value) << value
    self.count += 1

    true
  end

  def remove(value)
    return unless include?(value)

    bucket_for(value).delete(value)
    self.count -= 1
  end

  protected
  attr_accessor :buckets
  attr_writer :count

  def bucket_for(value, buckets = self.buckets)
    buckets[value_hash(value) % buckets.length]
  end

  # Modify this method to accomodate data types other than integers. 
  def value_hash(value)
    value
  end

  def resize!
    new_buckets = Array.new(buckets.length * 2) { [] }

    buckets.each do |bucket|
      bucket.each do |item|
        bucket_for(item, new_buckets) << item
      end
    end

    self.buckets = new_buckets
  end
end
