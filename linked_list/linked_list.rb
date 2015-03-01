require_relative 'sentinel_link'

class LinkedList
  def initialize
    self.first = SentinelLink(:first)
    self.last = SentinelLink(:last)

    self.first.insert_right(self.last)
  end

  # This method is not recommended due to O(n) time complexity.
  def [](idx)
    raise "Index out of bounds!" if idx < 0

    link = first
    (idx + 1).times do
      link = link.next

      raise "Index out of bounds" if link == last
    end

    link
  end

  def empty?
    first.next == last
  end

  def pop
    pop_link.value
  end

  def pop_link
    raise "Can't pop from empty list!" if empty?

    link = last.prev
    link.remove
    link
  end

  def push(value)
    push_link(Link.new(value))
  end

  def push_link(link)
    last.insert_left(link)
    link
  end

  def shift
    shift_link.value
  end

  def shift_link
    raise "Can't pop from empty list!" if empty?

    link = first.next
    link.remove
    link
  end

  def unshift(value)
    unshift_link.value
  end

  def unshift_link(link)
    first.insert_right(link)
    link
  end

  protected
  attr_accessor :first, :last
end
