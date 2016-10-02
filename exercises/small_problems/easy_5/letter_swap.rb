require 'pry'

def swap(word)
  array = word.split.map { |element| element.chars }
  array.each { |element| element[0], element[-1] = element[-1], element[0] }
  array.map { |element| element.join }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'