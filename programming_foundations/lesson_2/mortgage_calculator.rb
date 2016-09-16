def prompt(message)
  puts "=> #{message}"
end

prompt 'Welcome to Mortgage Calculator!'
prompt 'What is the amount of your loan?'
amount = gets.chomp

prompt 'What is the Annual Percentage Rate (APR)?'
prompt 'Example: For 3.5% enter 3.5'
interest_rate = gets.chomp

prompt 'What is the duration of the loan in years?'
years = gets.chomp

monthly_interest_rate = (interest_rate.to_f / 100) / 12
months = years.to_i * 12

monthly_payment = amount.to_f *
                  (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**-months.to_i))

prompt "Your monthly payment is #{monthly_payment}"
