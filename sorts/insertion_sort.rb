# Time: O(n**2), Space: O(1)
def insertion_sort(arr)
  arr.length.times do |i|
    j = i  
    while j > 0 && arr[j - 1] > arr[j]
      arr[j], arr[j - 1] = arr[j - 1], arr[j]
      j = j - 1
    end
  end

  arr
end
