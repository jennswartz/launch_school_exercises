require 'pry'

def substrings_at_start(string)
  result = []
  result << string
  until string.size == 1
    string = string.chop
    result.unshift(string)
  end
  result
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']