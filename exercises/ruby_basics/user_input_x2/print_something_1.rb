puts ">> Do you want me to print something? (y/n)"
answer = gets.chomp

if answer.downcase == 'y'
  puts "something"
elsif answer.downcase == 'n'
  return
else
  puts "help"
end