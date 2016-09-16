require 'pry'

def valid_number?(num)
  num.to_i != 0
end

def prompt(message)
  puts "=> #{message}"
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt "Welcome to Calculator! Enter your name:"
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure you enter a valid name."
  else
    break
  end
end

prompt "Hi #{name}"

loop do
  number_1 = ''
  loop do
    prompt "What is your first number?"
    number_1 = gets.chomp

    if valid_number?(number_1)
      break
    else
      prompt "Hmmm... that doesn't look like a valid number."
    end
  end

  number_2 = ''
  loop do
    prompt 'What is your second number?'
    number_2 = gets.chomp

    if valid_number?(number_2)
      break
    else
      prompt "Hmmm... that doesn't look like a valid number."
    end
  end

  operator_prompt = <<-MSG
  What operation do you want to perform?
      1 - add
      2 - subtract
      3 - multiply
      4 - divide
  MSG

  prompt(operator_prompt)
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3, or 4"
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers . . . ")

  result =  case operator
            when '1'
              number_1.to_i + number_2.to_i
            when '2'
              number_1.to_i - number_2.to_i
            when '3'
              number_1.to_i * number_2.to_i
            when '4'
              number_1.to_f / number_2.to_f
            end

  prompt "Your result is: #{result}"

  prompt "Do you want to perform another calculation? Y to calculate again."
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for using calculator!"
