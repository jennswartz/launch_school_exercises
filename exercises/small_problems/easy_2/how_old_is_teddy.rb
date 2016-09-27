age = rand(20..200)
puts "What name do you want to use?"
name = gets.chomp
name = 'Teddy' if name == ''

puts "#{name} is #{age} years old!"