def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def add_integers(num1, num2)
  num1.to_i + num2.to_i
end

def is_zero?(num)
  num.to_i == 0
end

def is_positive?(num)
  num.to_i > 0
end

def is_negative?(num)
  num.to_i < 0
end

loop do
  puts ">> Please enter a positive or negative integer:"
  integer_1 = gets.chomp

  puts ">> Please enter a positive or negative integer:"
  integer_2 = gets.chomp

  sum = add_integers(integer_1, integer_2)

  if is_zero?(integer_1) || is_zero?(integer_2)
    puts "Invalid input.  Only non-zero integers are allowed."
  elsif is_positive?(integer_1) && is_positive?(integer_2)
    puts "Sorry. One integer must be positive; one must be negative."
  elsif is_negative?(integer_1) && is_negative?(integer_2)
    puts "Sorry. One integer must be positive; one must be negative."
  elsif valid_number?(integer_1) && valid_number?(integer_2)
    puts "#{integer_1} + #{integer_2} = #{sum}"
    break
  end
end
