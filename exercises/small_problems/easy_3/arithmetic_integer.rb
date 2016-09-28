def prompt(message)
  puts "==> #{message}"
end

prompt "Enter the first number:"
number_1 = gets.chomp.to_i

prompt "Enter the second number:"
number_2 = gets.chomp.to_i

add = number_1 + number_2
subtract = number_1 - number_2
product = number_1 * number_1
quotient = number_1 / number_2
remainder = number_1 % number_2
power = number_2 ** number_1

prompt "#{number_1} + #{number_2} = #{add}"
prompt "#{number_1} - #{number_2} = #{subtract}"
prompt "#{number_1} * #{number_2} = #{product}"
prompt "#{number_1} / #{number_2} = #{quotient}"
prompt "#{number_1} % #{number_2} = #{remainder}"
prompt "#{number_1} ** #{number_2} = #{power}"