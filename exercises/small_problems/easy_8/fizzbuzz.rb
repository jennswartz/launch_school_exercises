require 'pry'

def fizzbuzz(num1, num2)
  numbers = (num1..num2).to_a
  result = numbers.map do |element|
    if element % 5 == 0 && element % 3 == 0
      "FizzBuzz"
    elsif element % 5 == 0
      "Buzz"
    elsif element % 3 == 0
      "Fizz"
    else
      element
    end
  end
  puts result.join(', ')
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
