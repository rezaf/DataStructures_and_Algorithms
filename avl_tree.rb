class Object
  def try(method, *args)
    self && self.send(method, *args)
  end

class AVLTreeNode
  attr_accessor :value, :parent, :left, :right, :depth

  def initialize(value)
    self.value = value
    self.depth = 1
  end

  def balance
    (right.try(:depth) || 0) - (left.try(:depth) || 0)
  end

  def balanced?
    balance.abs < 2
  end

  def parent_side
    return nil if parent.nil?
    parent.left == self ? :left : :right
  end

  def recalculate_depth!
    self.depth = [left.try(:depth) || 0, right.try(:depth) || 0].max + 1
  end
end

class AVLTree
  def initialize
    @root = nil
  end

  def empty?
    @root.nil?
  end

  def include?(value)
    vertex, parent = find(value)
    !!vertex
  end

  def insert(value)
    if empty?
      @root = AVLTreeNode.new(value)
      return true
    end

    vertex, parent = find(value)
    return false if vertex

    vertex = AVLTreeNode.new(value)
    if value < parent.value
      parent.left = vertex
    else
      parent.right = vertex
    end

    vertex.parent = parent
    update(parent)

    true
  end

  def traverse(vertex = @root)
    return if vertex.nil?

    traverse(vertex.left)
    traverse(vertex.right)
  end

  protected
  def find(value)
    vertex = @root
    parent = nil

    until vertex.nil?
      break if vertex.value == value

      parent = vertex
      if value < vertex.value
        vertex = vertex.left
      else
        vertex = vertex.right
      end
    end

    [vertex, parent]
  end

  def update(vertex)
    return if vertex.nil?

    if vertex.balance == -2
      left_rotate!(vertex.left) if vertex.left.balance == 1
      right_rotate!(vertex)
    elsif vertex.balance == 2
      right_rotate!(vertex.right) if vertex.right.balance == -1
      left_rotate!(vertex)
    else
      raise 'Error encountered!'
    end

    vertex.recalculate_depth!
    update(vertex.parent)
  end

  def left_rotate!(parent)
    parent_parent = parent.parent
    parent_side = parent.parent_side
    r_child = parent.right
    rl_child = r_child.try(:left)

    if parent_parent && parent_side == :left
      parent_parent.left = r_child
    elsif parent_parent && parent_side == :right
      parent_parent.right = r_child
    else
      @root = r_child
    end

    r_child.parent = parent_parent
    r_child.left = parent
    parent.parent = r_child

    parent.right = rl_child
    rl_child.parent = parent if rl_child

    parent.recalculate_depth!
  end

  def right_rotate!(parent)
    parent_parent = parent.parent
    parent_side = parent.parent_side
    l_child = parent.left
    lr_child = l_child.try(:right)

    if parent_parent && parent_side == :left
      parent_parent.left = l_child
    elsif parent_parent && parent_side == :right
      parent_parent.right = l_child
    else
      @root = l_child
    end

    l_child.parent = parent_parent
    l_child.right = parent
    parent.parent = l_child

    parent.left = lr_child
    lr_child.parent = parent if lr_child

    parent.recalculate_depth!
  end
end
