def oddities(array)
  counter = 0
  new_array = []
  until counter >= array.size
    new_array << array[counter]
    counter += 2
  end
  new_array
end


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
