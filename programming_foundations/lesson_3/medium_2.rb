# Question 1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_male_age = 0
munsters.select do |key, value|
  if value["gender"] == "male"
    total_male_age += value["age"]
  end
end

# Question 2
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.each do |key, value|
  puts "#{key} is a #{value["age"]} year old #{value["gender"]}."
end

# Question 3

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Question 4
sentence = "Humpty Dumpty sat on a wall."
words = sentence.split(/\W/)
words.reverse!.join(' ') + '.'


# Question 5
# 34

# Question 6
# it changed the original hash because the method was destructive

# Question 7
# paper

# Question 8
# "no"
