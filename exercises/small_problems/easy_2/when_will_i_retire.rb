CURRENT_YEAR = 2016

puts "What is your age?"
current_age = gets.chomp
current_age = current_age.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp
retire_age = retire_age.to_i

years_to_work = retire_age - current_age
retire_year = CURRENT_YEAR + years_to_work

puts "It's #{CURRENT_YEAR}.  You will retire in #{retire_year}."
puts "You have only #{years_to_work} year of work to go!"