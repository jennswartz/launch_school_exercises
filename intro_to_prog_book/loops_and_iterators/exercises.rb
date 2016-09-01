# Exercise 1
# returns the original array [1, 2, 3, 4, 5]

# Exercise 2
# puts "Enter a command"
# input = gets.chomp
# while input != "STOP"
#   puts "That was wrong.  What is your command?"
#   input = gets.chomp
# end

# Exercise 3
# array = ["Rudolph", "the", "red", "nosed", "reindeer"]
# array.each_with_index { |word, index| puts "#{index + 1}-#{word}"}

# Exercise 4

def countdown(number)
  if number <= 0
    puts number
  else
    puts number
    countdown(number - 1)
  end
end

countdown(100)

