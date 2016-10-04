require 'pry'

def swapcase(string)
  array = string.chars.map do |element|
    if element =~ /[a-z]/
      element.upcase
    elsif element =~ /[A-Z]/
      element.downcase
    else
      element
    end
  end
  p array
  array.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
