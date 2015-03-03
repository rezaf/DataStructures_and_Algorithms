# Time O(n**2), Space O(1)
def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true

    (0...(arr.length - 1)).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end

  arr
end
