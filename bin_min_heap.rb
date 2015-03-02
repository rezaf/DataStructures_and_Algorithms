class BinaryMinHeap
  def initialize
    self.store = []
  end

  def count
    store.length
  end

  def extract
    raise 'No element to extract!' if count == 0

    val = store[0]

    if count > 1
      store[0] = store.pop
      self.class.heapify_down(store, 0)
    else
      store.pop
    end

    val
  end

  def peek
    raise 'No element to peek!' if count == 0

    store[0]
  end

  def push(val)
    store << val
    self.class.heapify_up(store, self.count - 1)
  end

  def self.child_indices(len, parent_idx)
    [2 * parent_idx + 1, 2 * parent_idx + 2].select { |idx| idx < len }
  end

  def self.parent_index(child_idx)
    raise 'Root has no parent!' if child_idx == 0

    (child_idx - 1) / 2
  end

  def self.heapify_down(arr, parent_idx, len = arr.length)
    left_child_idx, right_child_idx = arr.child_indices(len, parent_idx)

    parent_val = arr[parent_idx]

    children = []
    children << arr[left_child_idx] if left_child_idx
    children << arr[right_child_idx] if right_child_idx

    return arr if children.all? { |child| parent_val < child }

    if children.length == 1
      swap_idx = left_child_idx
    else
      swap_idx = children[0] < children[1] ? left_child_idx : right_child_idx
    end

    arr[parent_idx] = arr[swap_idx]
    arr[swap_idx] = parent_val

    heapify_down(arr, swap_idx, len)
  end

  def self.heapify_up(arr, child_idx, len = arr.length)
    return arr if child_idx == 0

    parent_idx = parent_index(child_idx)
    child_val = arr[child_idx]
    parent_val = arr[parent_idx]

    return arr if child_val > parent_val

    arr[child_idx] = parent_val
    arr[parent_idx] = child_val

    heapify_up(arr, parent_idx, len)
  end

  protected
  attr_accessor :store
end
