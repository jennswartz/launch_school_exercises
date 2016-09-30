require 'pry'

def century_prefix(year)
  if year <= 100
    century = 1
  elsif year % 100 == 0
    century = year.to_s.chop.chop.to_i
  else
    century = year.to_s.chop.chop.to_i
    century = century + 1
  end
  century = century.to_s
end

def century(year)
  century = century_prefix(year)
  if century.end_with?('11', '12', '13')
    century << 'th'
  elsif century.end_with?('1')
    century << 'st'
  elsif century.end_with?('2')
    century << 'nd'
  elsif century.end_with?('3')
    century << 'rd'
  else
    century << 'th'
  end
  century
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

