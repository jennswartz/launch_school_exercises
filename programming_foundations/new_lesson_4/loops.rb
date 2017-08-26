# arr = [1, 2, 3, 4, 5]
# p arr.map { |number| number + 1 }

loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
