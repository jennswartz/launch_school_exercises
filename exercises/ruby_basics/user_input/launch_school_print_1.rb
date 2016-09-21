number_of_lines = nil
loop do
  puts ">> How many output lines do you want? Enter a number >= 3:"
  number_of_lines = gets.chomp
  break if number_of_lines.to_i >= 3
  puts ">> Retry - your entry is not valid."
end

count = 0
until number_of_lines.to_i == count do
  puts "Launch School is the best!"
  count += 1
end
