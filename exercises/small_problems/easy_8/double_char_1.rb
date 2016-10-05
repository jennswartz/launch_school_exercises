require 'pry'

def repeater(string)
  repeat = []
  string.each_char do |char|
    repeat << char << char
  end
  repeat.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''