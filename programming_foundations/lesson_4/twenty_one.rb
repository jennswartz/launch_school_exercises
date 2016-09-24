require 'pry'

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

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
HIT_OR_STAY_BREAK = 17

def prompt(msg)
  puts "=> #{msg}"
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
  prompt "#{PLAYER} has a #{player[0][:rank]} of #{player[0][:suit]} and " \
         "#{player[1][:rank]} of #{player[1][:suit]}."
  prompt "#{DEALER} has #{dealer[0][:rank]} of #{dealer[0][:suit]} and " \
         "an unknown card."
end

def display_hand(player)
  player.each do |key, value|
    prompt "  #{key[:rank]} of #{key[:suit]}"
  end
end

def busted?(score)
  score > GAME_MAX
end

def take_turn(deck_of_cards, hand_of_cards)
  deal_card(deck_of_cards, hand_of_cards)
  prompt "The hand is now:"
  display_hand(hand_of_cards)
end

def detect_winner(player, dealer)
  if total(player) > GAME_MAX
    return DEALER
  elsif total(dealer) > GAME_MAX
    return PLAYER
  elsif total(player) > total(dealer)
    return PLAYER
  elsif total(dealer) > total(player)
    return DEALER
  else
    nil
  end
end

def someone_won?(player, dealer)
  !!detect_winner(player, dealer)
end


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
  break if busted?(total(players_hand))
end

if busted?(total(players_hand))
  prompt "Sorry. You busted. Your total is #{total(players_hand)}."
  prompt "Dealer wins!"
  # add prompt to restart game
else
  prompt "You decided to stay!"
  prompt "It is now Dealer's turn."
  prompt "Dealer's cards are:"
  display_hand(dealers_hand)

  loop do
    break if total(dealers_hand) >= HIT_OR_STAY_BREAK || busted?(total(dealers_hand))
    prompt "Dealer decides to hit."
    take_turn(deck, dealers_hand)
  end

  if busted?(total(dealers_hand))
    prompt "Dealer busted.  Dealer's total is #{total(dealers_hand)}."
    prompt "You win!"
    # Add prompt to restart game
  elsif total(dealers_hand) >= HIT_OR_STAY_BREAK
    prompt "Dealer decided to stay."
    prompt "Time to decide a winner!"
    prompt "Player has #{total(players_hand)}."
    prompt "Dealer has #{total(dealers_hand)}."
    detect_winner(players_hand, dealers_hand)
    if someone_won?(players_hand, dealers_hand)
      prompt "#{detect_winner(players_hand, dealers_hand)} won this round!"
    else
      prompt "It's a tie!"
    end
  end
end
