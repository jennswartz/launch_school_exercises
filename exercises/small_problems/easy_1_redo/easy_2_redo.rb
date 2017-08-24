# Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?("Spot")

# Question 2
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.capitalize
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.merge!(additional_ages)


# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino")


# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones << "Dino"
p flintstones

advice = "Few things in life are as important as house training your pet dinosaur."
preadvice = advice.slice!("Few things in life are as important as ")
p advice
p preadvice


statement = "The Flintstones Rock!"
p statement.count('t')

title = "Flintstone Family Members"
p title.center(40)