require 'pry'

def find_fibonacci_index_by_length(number)
  array = [1, 1]
  until array.last.to_s.length == number
    result = 0
    array.each do
      result = (array[-1] + array[-2])
    end
    array << result
  end
  last = array.last
  array.find_index(last) + 1
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847