def sequence(number)
  results = []
  1.upto(number) { |num| results << num }
  results
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]