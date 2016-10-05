def double_consonants(string)
  repeat = []
  characters = string.chars
  characters.each do |char|
    if char =~ /[^1-9aeiou?!-. ]/
      repeat << char << char
    else
      repeat << char
    end
  end
  repeat.join
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""