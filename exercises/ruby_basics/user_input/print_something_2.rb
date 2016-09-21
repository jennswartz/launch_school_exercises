puts ">> Do you want me to print something (y/n)"
answer = gets.chomp

loop do
  if answer.downcase == 'y'
    puts "something"
    break
  elsif answer.downcase == 'n'
    break
  else
    puts "I didn't recognize that. Try again. (y/n)"
    answer = gets.chomp
  end
end