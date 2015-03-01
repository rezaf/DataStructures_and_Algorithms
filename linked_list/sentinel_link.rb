require_relative 'link'

class SentinelLink < Link
    def initialize(side)
    raise 'Incorrect side choice!' unless [:first, :last].include?(side)
    self.side = side
  end

  def prev=(link)
    if side == :last
      return super(link)
    else
      raise "Can't set prev of first sentinel!"
    end
  end

  def next=(link)
    if side == :first
      return super(link)
    else
      raise "Can't set next of last sentinel!"
    end
  end

  def value
    raise "Sentinels don't store values!"
  end

  def value=(link)
    raise "Sentinels don't store values!"
  end

  def remove
    raise "Can't remove a sentinel!"
  end

  protected
  attr_accessor :side
end
