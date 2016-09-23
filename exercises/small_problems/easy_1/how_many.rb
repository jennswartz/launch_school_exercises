# create a hash

def count_occurrences(array)
  occurrences = Hash.new

  array.uniq.each do |word|
    occurrences[word] = array.count(word)
  end

  occurrences.each do |key, value|
    puts "#{key} => #{value}."
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)