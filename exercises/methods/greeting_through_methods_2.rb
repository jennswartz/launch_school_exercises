def say_hello
  "Hello"
end

def say_world
  "World"
end

def greet(word1, word2)
  word1 + " " + word2
end

puts greet(say_hello, say_world)