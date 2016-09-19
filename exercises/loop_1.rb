# Runaway Loop
loop do
  puts 'Just keep printing...'
  break
end

# Loopception
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'

# Control the Loop
iterations = 1

until iterations > 5 do
  puts "Number of iterations = #{iterations}"
  iterations += 1
end

# Loop on Command
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end

# Say Hello
say_hello = true
iterator = 0

while say_hello
  puts 'Hello!'
  iterator += 1
  say_hello = false if iterator == 5
end

# Print While
numbers = Array(1..99)
count = 0

while count < 5
  count += 1
  puts numbers.sample(1)
end

# Count Up
count = 1

until count > 10
  puts count
  count += 1
end

# Print Until
counter = 0
numbers = [7, 9, 13, 25, 18]
until numbers.size == counter
  puts numbers[counter]
  counter += 1
end

# That's Odd
for i in 1..100
  puts i if i.odd?
end

# Greet Your Friends
friends = ['Sarah', 'John', 'Hannah', 'Dave']
for friend in friends
  puts "Hello, #{friend}!"
end
