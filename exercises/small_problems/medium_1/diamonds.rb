def diamond(n)
  spaces = " " * (n / 2)
  puts spaces + "*" * (n - (n - 1))
  n -= 2
  puts ' ' + "*" * (n - (n - 3))
  n += 2
  puts '' + "*" * n

end

p diamond(5)