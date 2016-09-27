require 'pry'

puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum; 'p' to compute the product."
function = gets.chomp
function = function.downcase

def sum(num)
  1.upto(num).inject(:+)
end

def product(num)
  1.upto(num).inject(:*)
end

if %w(s sum).include?(function)
  sum = sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}"
elsif %w(p product).include?(function)
  product = product(number)
  puts "The product of the integers between i and #{number} is #{product}"
else
  puts "Invalid entry."
end