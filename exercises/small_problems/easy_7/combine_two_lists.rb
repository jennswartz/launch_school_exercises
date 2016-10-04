def interleave(array_1, array_2)
  result_array = []
  index = 0
  array_1.each do |element|
    result_array << element
    result_array << array_2[index]
    index += 1
  end
  result_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
