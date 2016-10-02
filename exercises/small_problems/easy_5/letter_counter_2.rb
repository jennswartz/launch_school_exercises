require 'pry'

def word_sizes(string)
  results_hash = Hash.new(0)
  string = string.gsub(/[^\w\s\d]/, '')
  string.split.each do |element|
    results_hash[element.size] += 1
  end
  results_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
