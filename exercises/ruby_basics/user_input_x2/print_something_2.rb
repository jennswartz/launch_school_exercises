require 'pry'

loop do

  puts ">> Do you want me to print something? (y/n)"
  response = gets.chomp

  if response.downcase != 'y' && response.downcase != 'n'
    puts ">> Invalid input! Please enter y or n"
  elsif response.downcase == 'y'
    puts "something"
    break
  else response.downcase == 'n'
    break
  end
end