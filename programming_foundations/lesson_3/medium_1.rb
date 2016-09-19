# Question 1
# 10.times { |space| puts (" " * space) + "The Flintstones Rock!" }

# Question 2
# statement = "The Flintstones Rock"
# My attempt that didn't work
# letter_count = {}
# statement.each_char do |counter|
#   letter_count[counter] = letter_count.count
# end
# puts letter_count

# correct solution
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# Question 3
# Trying to concatenate integer into a string
# Fix number one
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Fix number two
puts "the value of 40 + 2 is #{(40 + 2)}"

# Question 4
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# Part 1 - output is
# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# Part 2 - output is
# 1
# 2

# Question 5
# change to while loop:
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
puts factors(0)
# Bonus 1 - to only divide if the number is divisible by the dividend
# Bonus 2 - to return the divisors

# Question 6
# Difference is that buffer << new_element modifies buffer such that
# buffer is permanently altered to include new element by mutating
# the caller.  In the second one, buffer is being reassigned to the
# value of input_array + [new_element] each time.

# Question 7
# there is a scoping error
# add limit as an additional argument then pass it when it is called
limit = 15

def fib(limit, first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(limit, 0, 1)
puts "result is #{result}"

# Question 8
def titleize(words)
  words.split.map { |word| word.capitalize }.join(' ')
end

puts titleize("hello my name is jenn")

# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  case value["age"]
  when 0...18
    value["age_group"] = "kid"
  when 18...65
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end

p munsters