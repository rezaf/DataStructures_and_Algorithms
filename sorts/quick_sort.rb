# Amortized: Time O(nlog(n)), Space O(log(n))
# Asymptotic: Time O(n**2), Space O(n**2)
def quick_sort(arr, start_idx = 0, len = arr.length)
  return arr if len < 2

  mid_idx = start_idx + len / 2
  pivot = arr[mid_idx]

  arr[start_idx], arr[mid_idx] = arr[mid_idx], arr[start_idx]
  pivot_idx = start_idx

  ((start_idx + 1)...(start_idx + len)).each do |idx|
    el = arr[idx]

    if el < pivot
      arr[idx] = arr[pivot_idx + 1]
      arr[pivot_idx + 1] = pivot
      arr[pivot_idx] = el

      pivot_idx += 1
    end
  end

  left_len = pivot_idx - start_idx
  right_len = len - (left_len + 1)
  quick_sort(arr, start_idx, left_len)
  quick_sort(arr, pivot_idx + 1, right_len)
end
