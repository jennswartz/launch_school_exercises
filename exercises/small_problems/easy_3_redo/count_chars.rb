puts "Please write word or multiple words:"
words = gets

scrunched_words = words.split.join
puts "There are #{scrunched_words.size} characters in \"#{words}\"."