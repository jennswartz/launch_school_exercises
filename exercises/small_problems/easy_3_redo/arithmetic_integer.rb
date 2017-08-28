puts "==> Enter the first number:"
number1 = gets.chomp

puts "==> Enter the second number:"
number2 = gets.chomp

addition = number1.to_i + number2.to_i
puts "==> #{number1} + #{number2} = #{addition}"

subtract = number1.to_i - number2.to_i
puts "==> #{number1} - #{number2} = #{subtract}"

product = number1.to_i * number2.to_i
puts "==> #{number1} * #{number2} = #{product}"

division = number1.to_f / number2.to_f
puts "==> #{number1} / #{number2} = #{division}"

remainder = number1.to_i % number2.to_i
puts "==> #{number1} % #{number2} = #{remainder}"

power = number1.to_i ** number2.to_i
puts "==> #{number1} ** #{number2} = #{power}"

