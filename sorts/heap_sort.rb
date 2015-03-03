require_relative '../bin_min_heap'

# Time: O(nlog(n)), Space: O(1)
def heap_sort(arr)
  2.upto(arr.length - 1).each do |heap_size|
    BinaryMinHeap.heapify_up(arr, heap_size - 1, heap_size)
  end

  arr.length.downto(2).each do |heap_size|
    arr[heap_size - 1], arr[0] = arr[0], arr[heap_size - 1]
    BinaryMinHeap.heapify_down(arr, 0, heap_size - 1)
  end

  arr.reverse
end
