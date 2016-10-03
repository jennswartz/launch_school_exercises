def halvsies(array)
  if array.size.odd?
    end_of_half_index = ((array.size - 1) / 2)
  else
    end_of_half_index = (array.size / 2) - 1
  end
  array_1 = array.slice(0..end_of_half_index)
  array_2 = array.slice((end_of_half_index + 1)..-1)
  [array_1, array_2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
