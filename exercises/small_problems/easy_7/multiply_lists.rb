def multiply_list(array_1, array_2)
  result_array = []
  array_1.each_with_index do |item, index|
    result_array << item * array_2[index]
  end
  result_array
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]