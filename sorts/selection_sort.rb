# Time: O(n**2), Space: O(1)
def selection_sort(arr)
  len = arr.length

  len.times do |j|
    min_idx = j

    ((j + 1)...len).each do |i|
      min_idx = i if arr[i] < arr[min_idx]
    end

    if min_idx != j
      arr[min_idx], arr[j] = arr[j], arr[min_idx]
    end
  end

  arr
end
