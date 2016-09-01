# Exercise 5
# this prints 3 to the screen (x starts at 0, add one each loop in 
# reassignment to x resulting in x = 3)
x = 0 
3.times do
  x += 1
end
puts x


# in the below, x was initialized inside the block, so it is not accessible
# outside the block

# y = 0
# 3.times do
#   y += 1
#   x = y
# end
# puts x

# Exercise 6
#trying to access variable or method named "shoes" that is undefined or 
#outside the scope for which it is being called
