# Question 1
# 1
# 2
# 2
# 3

# Question 2
# Part 1
# != means doesn't equal. You would use it as a comparative operator.
# Part 2
# use ! before something to reverse the logical state of the operand.
# Part 3
# use ! after something to show you are mutating the caller
# Part 4
# ternary operator
# Part 5
# shows you are using a boolean expression
# Part 6
# turn an object into its boolean equivalent

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub! "important", "urgent"
puts advice

# Question 4
# delete_at will delete at index (1) while delete will delete the number 1

# Question 5
(10..100).cover?(42)

# Question 6
famous_words = "seven years ago..."
# Solution 1
famous_words.prepend("Four score and ")
puts famous_words

# Solution 2
four_score = "Four score and "
four_score << famous_words
famous_words = four_score
puts famous_words

# Question 7
# 42

# Question 8
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten!

# Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# flintstones.select! { |name| name == "Barney"}
# flintstones = flintstones.to_a.flatten
# p flintstones

#OR - this works better!
p flintstones.assoc("Barney")

# Question 10
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p Hash[(0...flintstones.size).zip flintstones]

