require 'pry'

SUITS = %w(Clubs Diamonds Hearts Spades).freeze
RANK = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
ACE = 'Ace'.freeze
JACK = 'Jack'.freeze
QUEEN = 'Queen'.freeze
KING = 'King'.freeze
PLAYER = 'Player'.freeze
DEALER = 'Dealer'.freeze
FACE_CARD_VALUE = 10
ACE_HIGH = 11
ACE_LOW = 1
GAME_MAX = 21
HIT_STAY_BREAK = 17
ROUNDS_TO_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def initialize_full_deck(cards)
  SUITS.each do |suit|
    RANK.each do |rank|
      card_hash = {}
      card_hash[:suit] = suit
      card_hash[:rank] = rank
      card_hash[:high_value] = rank.to_i
      card_hash[:low_value] = rank.to_i
      cards.push(card_hash)
      face_card_handler(card_hash)
    end
  end
end

def face_card_handler(cards)
  case cards[:rank]
  when JACK
    cards[:high_value] = FACE_CARD_VALUE
    cards[:low_value] = FACE_CARD_VALUE
  when QUEEN
    cards[:high_value] = FACE_CARD_VALUE
    cards[:low_value] = FACE_CARD_VALUE
  when KING
    cards[:high_value] = FACE_CARD_VALUE
    cards[:low_value] = FACE_CARD_VALUE
  when ACE
    cards[:high_value] = ACE_HIGH
    cards[:low_value] = ACE_LOW
  end
end

def total(hand_of_cards)
  aces_high = hand_of_cards.map { |card| card[:high_value] }
  sum = aces_high.inject(:+)

  if sum > GAME_MAX
    aces_low = hand_of_cards.map { |card| card[:low_value] }
    sum = aces_low.inject(:+)
  end
  sum
end

def deal_card(deck_of_cards, hand_of_cards)
  deal_one_card = deck_of_cards.sample
  hand_of_cards.push(deal_one_card)
  deck_of_cards.delete(deal_one_card)
  deck_of_cards
end

def display_initial_hands(player, dealer)
  prompt "You have a #{player[0][:rank]} of #{player[0][:suit]} and " \
         "#{player[1][:rank]} of #{player[1][:suit]}."
  prompt "#{DEALER} has #{dealer[0][:rank]} of #{dealer[0][:suit]} and " \
         "an unknown card."
end

def display_hand(player)
  prompt "The cards are now:"
  player.each do |key, _|
    prompt "  #{key[:rank]} of #{key[:suit]}"
  end
end

def busted?(amount)
  total(amount) > GAME_MAX
end

def take_turn(deck_of_cards, hand_of_cards)
  deal_card(deck_of_cards, hand_of_cards)
  display_hand(hand_of_cards)
end

def detect_result(player, dealer)
  player_total = total(player)
  dealer_total = total(dealer)

  if player_total > GAME_MAX then :player_busted
  elsif dealer_total > GAME_MAX then :dealer_busted
  elsif dealer_total > player_total then :dealer
  elsif player_total > dealer_total then :player
  else :tie
  end
end

def display_result(player, dealer)
  result = detect_result(player, dealer)

  case result
  when :player_busted
    prompt "You busted! #{DEALER} wins!"
  when :dealer_busted
    prompt "#{DEALER} busted. You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "#{DEALER} wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def five_wins?(number_of_wins)
  number_of_wins[:player] == ROUNDS_TO_WIN ||
    number_of_wins[:dealer] == ROUNDS_TO_WIN
end

def display_five_round_winner(number_of_wins)
  if number_of_wins[:player] == ROUNDS_TO_WIN
    prompt "You won #{number_of_wins[:player]} rounds. " \
           "Dealer won #{number_of_wins[:dealer]} rounds. " \
           "You win! Congratulations!"
  elsif number_of_wins[:dealer] == ROUNDS_TO_WIN
    prompt "Dealer won #{number_of_wins[:dealer]} rounds. " \
           "You won #{number_of_wins[:player]} rounds. " \
           "Sorry! Dealer wins."
  else
    "Something went wrong! Score cannot be tabulated!"
  end
end

def play_again?
  answer = nil
  loop do
    puts "-------------------"
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp
    answer = answer.downcase
    break if %w(yes y n no).include?(answer)
    prompt "Invalid answer. Please answer yes or no (y or n)."
  end
  answer
end

def track_score(winner, number_of_wins)
  if winner == :player || winner == :dealer_busted
    number_of_wins[:player] += 1
  elsif winner == :dealer || winner == :player_busted
    number_of_wins[:dealer] += 1
  end
end

def display_score(number_of_wins)
  prompt "You have #{number_of_wins[:player]} wins. Dealer has " \
          "#{number_of_wins[:dealer]} wins."
  prompt "========================================="
  prompt "========================================="
end

score = { player: 0, dealer: 0 }
clear_screen
prompt "Welcome to the Twenty One!"

loop do
  deck = []
  players_hand = []
  dealers_hand = []

  initialize_full_deck(deck)

  2.times do
    deal_card(deck, players_hand)
    deal_card(deck, dealers_hand)
  end

  display_initial_hands(players_hand, dealers_hand)

  answer = nil
  loop do
    prompt "(You have #{total(players_hand)}.)"
    prompt "Do you want to hit (h) or stay (s)?"
    answer = gets.chomp
    clear_screen
    if answer.downcase.start_with?('s')
      break
    elsif answer.downcase.start_with?('h')
      take_turn(deck, players_hand)
      break if busted?(players_hand)
    else
      prompt "Invalid command."
      display_hand(players_hand)
    end
  end

  players_total = total(players_hand)
  if busted?(players_hand)
    prompt "Your total is #{players_total}."
    display_result(players_hand, dealers_hand)

  else
    prompt "You decided to stay at #{players_total}!"
    prompt "It is now #{DEALER}'s turn."
    display_hand(dealers_hand)

    loop do
      break if total(dealers_hand) >= HIT_STAY_BREAK || busted?(dealers_hand)
      prompt "#{DEALER} hits!"
      take_turn(deck, dealers_hand)
    end

    dealers_total = total(dealers_hand)
    if busted?(dealers_hand)
      prompt "#{DEALER}'s total is #{dealers_total}."
      display_result(players_hand, dealers_hand)

    elsif total(dealers_hand) >= HIT_STAY_BREAK
      prompt "#{DEALER} stays at #{dealers_total}!"
      prompt "Time to decide a winner!"
      prompt "You have #{total(players_hand)}."
      prompt "#{DEALER} has #{dealers_total}."
      display_result(players_hand, dealers_hand)
    end
  end

  game_result = detect_result(players_hand, dealers_hand)
  track_score(game_result, score)
  display_score(score)

  next unless five_wins?(score)
  display_five_round_winner(score)
  score = { player: 0, dealer: 0 }
  break if play_again?.start_with?('n')
end

prompt "Thank you for playing Twenty-One! Good-bye."
