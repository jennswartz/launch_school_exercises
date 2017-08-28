def prompt(ordinal)
  puts "==> Enter the #{ordinal} number:"
end

numbers = []

prompt "1st"
number1 = gets.chomp
numbers << number1

prompt "2nd"
number2 = gets.chomp
numbers << number2

prompt "3rd"
number3 = gets.chomp
numbers << number3

prompt "4th"
number4 = gets.chomp
numbers << number4

prompt "5th"
number5 = gets.chomp
numbers << number5

prompt "last"
number6 = gets.chomp

if numbers.include?(number6)
  puts "The number #{number6} appears in #{numbers}."
else
  puts "The number #{number6} does not appear in #{numbers}."
end

