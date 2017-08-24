PASSWORD = 'SecreT'

loop do
  puts ">> Please enter your password:"
  pass = gets.chomp

  unless pass == PASSWORD
    puts "Invalid password!"
  else
    puts "Welcome!"
    break
  end
end
