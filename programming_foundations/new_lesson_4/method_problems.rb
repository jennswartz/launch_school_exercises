require 'pry'

# 1
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# flintstone_hash = {}
# counter = 0

# until counter == flintstones.size
#     current_key = flintstones[counter]
#     flintstone_hash[current_key] = counter
#     counter += 1
# end

# p flintstone_hash

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end

# 2
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.inject(:+)

# 3
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# p ages.reject! { |key, value| value >= 100  }

# 4
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.min

# 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones
# p flintstones.index { |name| name.start_with?("Be") }
# p flintstones.index { |name| name[0, 2] == "Be" }

# 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones.map { |name| name.slice(0..2) }

# 7
# statement = "The Flintstones Rock"
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# p result

# 8
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

#during the first iteration, the 2 will be deleted; during second
#the 4 will be deleted, so only 1 and 3 will be added to the array

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

#only 1 and 2 will be added

# 9
# words = "the flintstones rock"
# p words.split.map {|word| word.capitalize }.join(' ')

#10
require 'pry'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0..18
    details["age_group"] = "kid"
  when 18..65
    details["age_group"] = "kid"
  else
    details["age_group"] = "senior"
  end
  p munsters
end