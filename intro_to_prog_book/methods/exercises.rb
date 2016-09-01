# Exercise 1
def greeting(name)
  "Hello #{name}."
end

puts greeting("Jenn") 

# Exercise 2
# 1. 2
# 2. nil
# 3. "Joe"
# 4. "four"
# 5. nil

# Exercise 3
def multiply(num1, num2)
  num1 * num2  
end

puts multiply(3, 5)

# Exercise 4
# nothing is printed because return is in the middle of the method
# nothing after the return keyword is run

# Exercise 5
def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")
#it returns nil because the puts returns a nil

# Exercise 6
# only one argument was passed to the method when it required two