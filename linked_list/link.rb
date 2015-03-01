class Link
  attr_accessor :value
  attr_reader :prev, :next

  def initialize(value)
    self.value = value
  end

  def insert_left(link)
    unless link.is_detached?
      raise "Trying to insert a link that is not detached!"
    end

    link.next = self
    link.prev = self.prev
    self.prev.next = link if self.prev
    self.prev = link

    nil
  end

  def insert_right(link)
    unless link.is_detached
      raise "Trying to insert a link that is not detached!"
    end

    link.next = self.next
    link.prev = self
    self.next.prev = link if self.next
    self.next = link

    nil
  end

  def is_detached?
    !(self.next || self.prev)
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
    self.prev = nil
    self.next = nil
  end

  protected
  attr_writer :prev, :next
end
