puts "What is your age?"
age = gets.to_i

puts "At what age would you like to retire?"
retire_age = gets.to_i

difference_in_age = retire_age - age
retirement_year = Time.now.year + difference_in_age

puts "It's 2017.  You will retire in #{retirement_year}." + "\n" \
     "You have only #{difference_in_age} years of work to go!"