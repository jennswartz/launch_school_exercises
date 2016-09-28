def oddities(arr)
  counter = 0
  odd_value = []
  while counter < arr.size
    odd_value << arr[counter]
    counter += 2
  end
  odd_value
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []