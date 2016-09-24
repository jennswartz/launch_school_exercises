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
TEN = 10
ELEVEN = 11
ONE = 1
GAME_MAX = 21

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_full_deck(cards)
  SUITS.each do |suit|
    RANK.each do |rank|
      card = {}
      card[:suit] = suit
      card[:rank] = rank
      card[:high_value] = rank.to_i
      card[:low_value] = rank.to_i
      cards.push(card)
      face_card_handler(card)
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
  prompt "Dealer has #{dealer[0][:rank]} of #{dealer[0][:suit]} and " \
         "an unknown card."
end

def display_players_hand(player)
  prompt "You have: "
  player.each do |key, value|
    prompt "#{key[:rank]} of #{key[:suit]}"
  end
end

def busted?(score)
  score > GAME_MAX
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
  prompt "Do you want to hit or stay?"
  answer = gets.chomp
  break if %w(s stay).include?(answer)
  deal_card(deck, players_hand)
  display_players_hand(players_hand)
  break if busted?(total(players_hand))
end

if busted?(total(players_hand))
  prompt "You busted - your total is #{total(players_hand)}."
end



# p players_hand
# puts total(players_hand)
