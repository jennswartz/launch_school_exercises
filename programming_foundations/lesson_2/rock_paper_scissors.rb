require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It is a tie!"
  end
end

def check_choices(choice)
  if choice == 'r'
    choice = 'rock'
  elsif choice == 'p'
    choice = 'paper'
  elsif choice == 's'
    choice = 'scissors'
  elsif choice == 'l'
    choice = 'lizard'
  else
    choice = 'spock'
  end
end

player_win_counter = 0
computer_win_counter = 0

prompt "Welcome to #{VALID_CHOICES.join(', ')}."
prompt "It is you versus the computer."
prompt "First player to score five wins."

until player_win_counter >= 5 || computer_win_counter >= 5
  choice = ''

  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}."
    prompt "Type first letter or sp for spock."
    choice = gets.chomp

    choice = check_choices(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt 'That is not a valid choice.'
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}."

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_win_counter += 1
  elsif win?(computer_choice, choice)
    computer_win_counter += 1
  end

  prompt "Total Player Wins: #{player_win_counter}"
  prompt "Total Computer Wins: #{computer_win_counter}"
end

if player_win_counter > computer_win_counter
  prompt "Congratulations!"
  prompt "You won #{player_win_counter} to #{computer_win_counter}."
else
  prompt "Sorry. You lost #{computer_win_counter} to #{player_win_counter}."
end

prompt "Thank you for playing.  Good-bye."
