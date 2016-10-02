require 'pry'

def crunch(string)
  array = string.chars
  result = []
  counter = 1
  array.each do |element|
    result << element if element != array[counter]
    counter += 1
  end
  result.join
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
#crunch('4444abcabccba') #== '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
