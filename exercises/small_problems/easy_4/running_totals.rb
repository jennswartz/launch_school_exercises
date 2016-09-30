require 'pry'

# def running_total(array)
#   running_total_array = []
#   running_total_array << array[0] unless array.empty?
#   while array.length > 1
#     running_total_array << running_total_array[-1] + array[1]
#     array.shift
#   end
#   running_total_array
# end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []