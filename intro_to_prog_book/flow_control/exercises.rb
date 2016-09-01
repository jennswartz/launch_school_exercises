# Exercise 1
# 1.  false
# 2.  false
# 3.  false
# 4.  true
# 5.  true

# Exercise 2
# def all_caps(string)
#   if string.length > 10
#     string.upcase
#   else
#     string
#   end
# end

# puts all_caps("hello world")
# puts all_caps("hello")

# Exercise 3

# puts "Enter a number between 0 and 100."
# number = gets.chomp.to_i
# if number >= 0 && number <= 50
#   puts "Your number is between 0 and 50"
# elsif number > 50 && number <= 100
#   puts "Your number is between 51 and 100"
# elsif number > 100
#   puts "Exercise is written poorly and says to report back if number is over 100."
# else
#   puts "You did not enter a number between 0 and 100."
# end


# Exercise 4
# 1. FALSE
# 2. Did you get it right?
# 3. "Alright now."

# Exercise 5
def evaluate_number(number)
  if number >= 0 && number <= 50
    puts "Your number is between 0 and 50"
  elsif number > 50 && number <= 100
    puts "Your number is between 51 and 100"
  elsif number > 100
    puts "Exercise is written poorly and says to report back if number is over 100."
  else
    puts "You did not enter a number between 0 and 100."
  end
end

def evaluate_case_number(number)
  case number
  when 0..50
    puts "Your number is between 0 and 50"
  when 51..100
    puts "Your number is between 51 and 100"
  else
    if number < 0
      puts "You did not enter a number between 0 and 100."
    else
      puts "Your number is above 100"
    end
  end
end

puts "Enter a number between 0 and 100."
number = gets.chomp.to_i

evaluate_number(number)
evaluate_case_number(number)

# Exercise 6
# add an end before the last end to close the if/else
