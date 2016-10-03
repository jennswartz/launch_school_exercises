def triangle(num)
  spaces = num - 1
  stars = 1
  num.times do |n|
    puts (" " * spaces) + ("*" * stars)
    stars += 1
    spaces -= 1
  end
end

triangle(9)