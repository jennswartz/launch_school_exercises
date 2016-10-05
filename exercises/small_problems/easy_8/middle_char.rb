def center_of(string)
  size = string.size
  mid_point = size / 2
  if size.odd?
    string[mid_point]
  else
    string[mid_point - 1] + string[mid_point]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'