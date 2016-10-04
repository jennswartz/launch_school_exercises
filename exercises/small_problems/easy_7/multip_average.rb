def calc_multiplicative_average(array)
  multiply = array.inject(:*)
  total = multiply.to_f / array.length.to_f
end

def show_multiplicative_average(array)
  result = calc_multiplicative_average(array)
  puts "The result is #{format('%.3f', result)}."
end

show_multiplicative_average([3, 5])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
