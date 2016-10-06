def sequence(num_1, num_2)
  results = []
  until num_1.zero? do
    results.unshift(num_2 * num_1)
    num_1 -= 1
  end
  results
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
