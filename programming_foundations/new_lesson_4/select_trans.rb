# def select_vowels(str)
#   selected_chars = ''
#   counter = 0

#   loop do
#     current_char = str[counter]

#     if 'aeiouAEIOU'.include?(current_char)
#       selected_chars << current_char
#     end

#     counter += 1
#     break if counter == str.size
#   end

#   selected_chars
# end

# p select_vowels("hello")

# require 'pry'

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(produce_list)
#   produce_keys = produce_list.keys
#   counter = 0
#   selected_fruits = Hash.new

#   loop do
#     break if counter == produce_keys.size

#     current_key = produce_keys[counter]
#     current_value = produce_list[current_key]

#     if current_value == 'Fruit'
#       selected_fruits[current_key] = current_value
#     end

#     counter += 1
#   end

#   selected_fruits
# end
# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     numbers[counter] = current_number * 2

#     counter += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

# def double_odd_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if current_number.odd?
#     numbers[counter] = current_number

#     counter += 1
#   end

#   numbers
# end

# p my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers!(my_numbers)  # => [2, 4, 6, 14, 2, 6]
# p my_numbers


# def double_odd_indices(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_indices(my_numbers) # => [1, 8, 3, 14, 2, 12]


def multiply(my_numbers, multiplier)
  counter = 0

  loop do
    break if counter == my_numbers.size

    current_number = my_numbers[counter]
    my_numbers[counter] = current_number * multiplier

    counter += 1
  end

  my_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]