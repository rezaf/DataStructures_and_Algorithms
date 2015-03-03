require_relative '../bin_min_heap'

# Time: O(nlog(n)), Space: O(1)
def heap_sort(arr)
  2.upto(arr.length - 1).each do |heap_sz|
    BinaryMinHeap.heapify_up(arr, heap_sz - 1, heap_sz)
  end

  arr.length.downto(2).each do |heap_sz|
    arr[heap_sz - 1], arr[0] = arr[0], arr[heap_sz - 1]
    BinaryMinHeap.heapify_down(arr, 0, heap_sz - 1)
  end

  arr.reverse
end
