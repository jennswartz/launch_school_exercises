puts ">> Please enter an integer greater than 0:"
response = gets.chomp
number = response.to_i

puts ">> Enter 's' to compute the sum; 'p' to compute the product."
computation = gets.chomp
computation = computation.downcase

result = []
while number > 0
  result << number
  number -= 1
end
if computation == 's'
  result = result.inject(:+)
  puts "The sum of the integers between 1 and #{response} is #{result}."
elsif computation == 'p'
  result = result.inject(:*)
  puts "The product of the integers between 1 and #{response} is #{result}."
else
  puts "Sorry. That is an unrecognized response."
end
