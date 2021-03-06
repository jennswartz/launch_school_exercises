require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals
PLAYER_WHO_GOES_FIRST = 'choose'.freeze # use 'choose', 'computer', or 'player'
PLAYER = 'Player'.freeze
COMPUTER = 'Computer'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts ""
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "     |     |"
  puts " #{brd[1]}   |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[4]}   |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[7]}   |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def clear_screen
  system('clear') || system('cls')
end

def display_score(score1, score2)
  puts "#{PLAYER} score: #{score1}. #{COMPUTER} score: #{score2}."
end

def display_all(brd, score1, score2)
  display_board(brd)
  display_score(score1, score2)
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_squares(brd)
  brd.keys.select { |num| brd[num] == PLAYER_MARKER }
end

def center_square_empty?(brd)
  brd[5] == INITIAL_MARKER
end

def joinor(arr, delimiter=', ', conjunction='or')
  arr[-1] = "#{conjunction} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry. That's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_offensive_play(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def find_defensive_play(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = find_offensive_play(brd)
  square = find_defensive_play(brd) if !square
  square = 5 if !square && center_square_empty?(brd)
  square = empty_squares(brd).sample if !square
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return PLAYER
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return COMPUTER
    end
  end
  nil
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def place_piece!(brd, player)
  player_places_piece!(brd) if player == PLAYER
  computer_places_piece!(brd) if player == COMPUTER
end

def alternate_player(player)
  if player == COMPUTER
    PLAYER
  elsif player == PLAYER
    COMPUTER
  end
end

def choose_who_plays_first(player)
  loop do
    prompt "Who do you want to go first?"
    prompt "Enter C for #{COMPUTER} or P for #{PLAYER}."
    answer = gets.chomp
    return PLAYER if answer.downcase.start_with?('p')
    return COMPUTER if answer.downcase.start_with?('c')
    prompt "That was not a valid entry. Please retry."
  end
  player
end

def five_wins?(score1, score2)
  score1 == 5 || score2 == 5
end

computer_score = 0
player_score = 0
current_player = nil

prompt "Welcome to Tic Tac Toe!"
prompt "The first to score five wins!"

case PLAYER_WHO_GOES_FIRST
when 'choose'
  current_player = choose_who_plays_first(current_player)
when 'player'
  current_player = PLAYER
when 'computer'
  current_player = COMPUTER
end

loop do
  loop do
    board = initialize_board
    display_all(board, player_score, computer_score)

    loop do
      place_piece!(board, current_player)
      clear_screen
      display_board(board)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if detect_winner(board) == PLAYER
      player_score += 1
    elsif detect_winner(board) == COMPUTER
      computer_score += 1
    end

    if someone_won?(board)
      prompt "#{detect_winner(board)} won this round!"
      display_score(player_score, computer_score)
    else
      prompt "It's a tie!"
    end

    next unless five_wins?(player_score, computer_score)
    prompt "#{detect_winner(board)} scored five points and wins!"
    player_score = 0
    computer_score = 0
    break
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  current_player = choose_who_plays_first(current_player)
end

prompt "Thanks for playing Tic Tac Toe! Good-bye."
