def repeater(string)
  string.length + 2
end

def print_in_box(string)
  repeater = repeater(string)
  ends = "+" + ("-" * repeater) + "+\n"
  spaces = "|" + (" " * repeater) + "|\n"
  text = "| " + string + " |\n"
  puts ends + spaces + text + spaces + ends
end

print_in_box('To bold go where no one has gone before.')