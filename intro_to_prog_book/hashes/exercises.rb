# Exercise 1
# family = {  uncles: ["bob", "joe", "steve"],
#             sisters: ["jane", "jill", "beth"],
#             brothers: ["frank","rob","david"],
#             aunts: ["mary","sally","susan"]
#           }

# immediate_family = family.select do |key, value|
#   key == :sisters || key == :brothers
# end

# array = immediate_family.values.flatten

# p array

# Exercise 2
# merge returns a new hash while merge! is destructive and changes
# the contents of the original hash
# family = {  uncles: ["bob", "joe", "steve"],
#             sisters: ["jane", "jill", "beth"],
#             brothers: ["frank","rob","david"],
#             aunts: ["mary","sally","susan"]
#           }
# parents = { parents: ["dave", "nancy"]  }

# family.merge(parents)
# puts family # original hash is not modified
# family.merge!(parents)
# puts family # original hash is modified to add parents hash

# Exercise 3
# family = {  dad: "bob",
#             mom: "jane",
#             brother: "frank",
#             sister: "mary",
#           }

# family.each_key { |key| puts key }
# family.each_value { |value| puts value }
# family.each { |key, value| puts "#{key} is #{value}" }

# Exercise 4
# person[:name]

# Exercise 5
# family = {  dad: "bob",
#             mom: "jane",
#             brother: "frank",
#             sister: "mary",
#           }
# p family.value?("mary")

# Exercise 6
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']

# result = {}

# words.each do |word|
#   key = word.split('').sort.join
#   if result.has_key?(key)
#     result[key].push(word)
#   else
#     result[key] = [word]
#   end
# end

# result.each do |k, v|
#   puts "------"
#   p v
# end

# Exercise 7
# x is a symbol in the first and a variable in the second

# Exercise 8
# B