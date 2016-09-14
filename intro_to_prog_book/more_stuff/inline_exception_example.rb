zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Cant do that!"
puts "After each call"