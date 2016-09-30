def short_long_short(string_1, string_2)
  array = [string_1, string_2]
  longest = array.max { |one, two| one.length <=> two.length }

  if longest == string_1
    string_2 + string_1 + string_2
  else
    string_1 + string_2 + string_1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"