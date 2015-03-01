class Link
  attr_accessor :value
  attr_reader :prev, :next

  def initialize(value)
    self.value = value
  end

  def insert_left(link)
    ensure_detached

    link.next = self
    link.prev = self.prev
    self.prev.next = link if self.prev
    self.prev = link

    nil
  end

  def insert_right(link)
    ensure_detached

    link.next = self.next
    link.prev = self
    self.next.prev = link if self.next
    self.next = link

    nil
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
    self.prev = nil
    self.next = nil
  end

  protected
  attr_writer :prev, :next

  def ensure_detached
    if (self.next || self.prev)
      raise "Trying to insert a link that is not detached!"
    end
  end
end
