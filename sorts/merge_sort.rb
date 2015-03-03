def merge_sort(arr)
  return arr if arr.length < 2

  middle = arr.length / 2
  left = arr[0...middle]
  right = arr[middle...(arr.length)]

  sleft = merge_sort(left)
  sright = merge_sort(right)

  merge(sleft, sright)
end

def merge(sleft, sright)
  merged = []

  until sleft.empty? || sright.empty?
    if sleft[0] < sright[0]
      merged << sleft.shift
    else
      merged << sright.shift
    end
  end

  merged + sleft + sright
end
