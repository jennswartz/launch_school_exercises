def count_occurrences(array)
  array.uniq.each do |type|
    puts "#{type} => #{array.count(type)}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)