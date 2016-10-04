def penultimate(string)
  words = string.split
  words[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'