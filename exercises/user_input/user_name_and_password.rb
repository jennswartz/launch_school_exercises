PASSWORD = 'SecreT'
USERNAME = 'admin'

loop do
  puts '>> Please enter your user name:'
  username_check = gets.chomp
  puts '>> Please enter your password:'
  password_check = gets.chomp
  break if password_check == PASSWORD && username_check == USERNAME
  puts ">> Authorization Failed!"
end

puts "Welcome!"
