PASSWORD = 'SecreT'

loop do
  puts '>> Please enter your password:'
  password_check = gets.chomp
  if password_check == PASSWORD
    puts "Welcome!"
    break
  else
   puts ">> Invalid password!"
  end
end