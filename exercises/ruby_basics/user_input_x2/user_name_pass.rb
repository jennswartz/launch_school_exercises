PASSWORD = 'SecreT'
USERNAME = 'admin'

loop do
  puts "Please enter user name:"
  name_try = gets.chomp

  puts "Please enter your password:"
  pass_try = gets.chomp

  if name_try != USERNAME || pass_try != PASSWORD
    puts ">> Authorization failed!"
  else
    puts "Welcome!"
    break
  end
end