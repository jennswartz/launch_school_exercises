require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals
PLAYER_WHO_GOES_FIRST = 'choose'
PLAYER = 'player'
COMPUTER = 'computer'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  # system 'clear'
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

def display_score(score1, score2)
  puts "Player score: #{score1}. Computer score: #{score2}."
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

def square_5_empty?(brd)
  brd[5] == INITIAL_MARKER
end

def joinor(arr, punctuation=', ', conjunction='or')
  arr[-1] = "#{conjunction} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(punctuation)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # computer plays offensive play first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # computer plays defensive play next
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # computer will pick square 5 if it is empty
  square = 5 if !square && square_5_empty?(brd)

  # otherwise computer will pick a random square
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
  if player == PLAYER
    player_places_piece!(brd)
  elsif player == COMPUTER
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  if player == COMPUTER
    return PLAYER
  elsif player == PLAYER
    return COMPUTER
  end
end

computer_score = 0
player_score = 0
first_player = nil


prompt "Welcome to Tic Tac Toe!"
prompt "The first to score five wins the round!"

loop do
  if PLAYER_WHO_GOES_FIRST == 'choose'
    prompt "Who do you want to go first? (player or computer)"
    answer = gets.chomp
    if answer.downcase.start_with?('p')
      first_player = PLAYER
      break
    elsif answer.downcase.start_with?('c')
      first_player = COMPUTER
      break
    else
      prompt "That was not a valid entry. Please retry."
    end
  end
end

loop do
  loop do
    board = initialize_board

    #  If set at player goes first or player is select, player goes first
    if PLAYER_WHO_GOES_FIRST == PLAYER || first_player == PLAYER
      current_player = PLAYER
    elsif
      current_player = COMPUTER
    end

    display_board(board)

    loop do
      place_piece!(board, current_player)
      display_board(board)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won this round!"
    else
      prompt "It's a tie!"
    end

    if detect_winner(board) == PLAYER
      player_score += 1
    elsif detect_winner(board) == COMPUTER
      computer_score += 1
    end

    display_score(player_score, computer_score)

    if player_score == 5 || computer_score == 5
      prompt "#{detect_winner(board)} scored five points and wins the round!"
      break
    end
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good-bye."
