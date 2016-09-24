require 'pry'

SUITS = %w(Clubs Diamonds Hearts Spades).freeze
RANK = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
ACE = 'Ace'.freeze
JACK = 'Jack'.freeze
QUEEN = 'Queen'.freeze
KING = 'King'.freeze
PLAYER = 'Player'.freeze
DEALER = 'Dealer'.freeze
TEN = 10
ELEVEN = 11
ONE = 1
GAME_MAX = 21
HIT_STAY_BREAK = 17

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
    cards[:high_value] = TEN
    cards[:low_value] = TEN
  when QUEEN
    cards[:high_value] = TEN
    cards[:low_value] = TEN
  when KING
    cards[:high_value] = TEN
    cards[:low_value] = TEN
  when ACE
    cards[:high_value] = ELEVEN
    cards[:low_value] = ONE
  end
end

def total(hand_of_cards)
  aces_high = hand_of_cards.map { |card| card[:high_value] }
  sum = aces_high.inject { |add, card| add + card }

  if sum > GAME_MAX
    aces_low = hand_of_cards.map { |card| card[:low_value] }
    sum = aces_low.inject { |add, card| add + card }
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
  player.each do |key, _|
    prompt "  #{key[:rank]} of #{key[:suit]}"
  end
end

def busted?(score)
  total(score) > GAME_MAX
end

def take_turn(deck_of_cards, hand_of_cards)
  deal_card(deck_of_cards, hand_of_cards)
  prompt "The hand is now:"
  display_hand(hand_of_cards)
end

def detect_winner(player, dealer)
  if total(player) > GAME_MAX || total(dealer) > total(player)
    return DEALER
  elsif total(dealer) > GAME_MAX || total(player) > total(dealer)
    return 'You'
  end
end

def someone_won?(player, dealer)
  !!detect_winner(player, dealer)
end

def play_again?
  puts "-------------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  clear_screen
  answer.downcase.start_with?('y')
end

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
    prompt "Do you want to hit (h) or stay (s)?"
    answer = gets.chomp
    break if answer.downcase.start_with?('s')
    take_turn(deck, players_hand)
    break if busted?(players_hand)
  end

  player_total = total(players_hand)
  if busted?(players_hand)
    prompt "Sorry. You busted. #{DEALER} wins!"
    prompt "Your total is #{player_total}."
    play_again? ? next : break
  else
    prompt "You decided to stay at #{player_total}!"
    prompt "It is now #{DEALER}'s turn."
    prompt "#{DEALER}'s cards are:"
    display_hand(dealers_hand)

    loop do
      if total(dealers_hand) >= HIT_STAY_BREAK || busted?(dealers_hand)
        break
      end
      prompt "#{DEALER} hits!"
      take_turn(deck, dealers_hand)
    end

    dealer_total = total(dealers_hand)
    if busted?(dealers_hand)
      prompt "#{DEALER} busted!"
      prompt "#{DEALER}'s total is #{dealer_total}."
      prompt "You win!"
      play_again? ? next : break
    elsif total(dealers_hand) >= HIT_STAY_BREAK
      prompt "#{DEALER} stays at #{dealer_total}!"
      prompt "Time to decide a winner!"
      prompt "#{DEALER} has #{dealer_total}."
      prompt "You have #{total(players_hand)}."
      detect_winner(players_hand, dealers_hand)
      if someone_won?(players_hand, dealers_hand)
        prompt "#{detect_winner(players_hand, dealers_hand)} won this round!"
      else
        prompt "It's a tie!"
      end
    end
  end
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good-bye."
