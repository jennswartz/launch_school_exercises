# Exercise 1
def has_lab?(string)
  if string =~ /lab/
    puts string
  else
    puts "No match."
  end
end

has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")

# Exercise 2
# It won't print b/c block isn't activated with .call.
# Returns a Proc object

# Exercise 3
# Provides a way to handle things that would otherwise raise an
# error; allows the program to keep executing

# Exercise 4
def execute(&block)
  block.call
end

# Exercise 5
# The code is missing the & in the parameter; therefore, it can't
# pass the block as a parameter
execute { puts "Hello from inside the execute method!" }