require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

win_hash = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(paper spock),
  'spock' => %w(rock scissors)
}

def win?(win_hash, first, second)
  win_hash[first].include?(second)
end

def display_results(win_hash, player, computer)
  if win?(win_hash, player, computer)
    prompt "You won!"
  elsif win?(win_hash, computer, player)
    prompt "Computer won!"
  else
    prompt "It is a tie!"
  end
end

def check_choices(word)
  case word
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  end
end

player_win_counter = 0
computer_win_counter = 0

prompt "Welcome to #{VALID_CHOICES.join(', ')}."
prompt "It is You versus the Computer."
prompt "First player to score five wins."

until player_win_counter >= 5 || computer_win_counter >= 5
  choice = ''

  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}."
    prompt "Type the first letter or sp for spock."
    choice = gets.chomp
    choice.downcase!
    choice = check_choices(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That is not a valid choice."
      prompt "Type just the first letter or sp for spock"
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}."

  display_results(win_hash, choice, computer_choice)

  if win?(win_hash, choice, computer_choice)
    player_win_counter += 1
  elsif win?(win_hash, computer_choice, choice)
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
