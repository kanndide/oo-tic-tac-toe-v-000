class TicTacToe

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(index, token = "X")
  @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) == false
      false
    elsif position_taken?(index) == false
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index) == true
      move(index, token = "X")
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" || @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.include?(" ") == false
  end

  def draw?
    if won? == false && full? == true
      true
    end
  end

  def over?
   draw? == true || won? != false
  end

end



#################################

#def move(board, index, value)
#  value == "X" || "O"
#  board[index] = value
#end

#def position_taken?(board, index)
#    !(board[index].nil? || board[index] == " ")
#end

#def valid_move?(board, index)
#  if index.between?(0, 8) == false
#    false
#  elsif position_taken?(board, index) == false
#    true
#  end
#end

#def turn(board)
#  puts "Please enter 1-9:"
#  user_input = gets.strip
#  index = input_to_index(user_input)
#  if valid_move?(board, index) == true
#    move(board, index, "#{current_player(board)}")
#    display_board(board)
#  else
#    turn(board)
#  end
#end

#def turn_count(board)
#  count = 0
#  board.each do |turns|
#    count += 1 if "#{turns}" != " "
#  end
#  return count
#end

#def current_player(board)
#  current_player = turn_count(board).odd? ? "O" : "X"
#end

#def won?(board)
#  WIN_COMBINATIONS.each do |win_combination|
#    win_index_1 = win_combination[0]
#    win_index_2 = win_combination[1]
#    win_index_3 = win_combination[2]
#    position_1 = board[win_index_1] # load the value of the board at win_index_1
#    position_2 = board[win_index_2] # load the value of the board at win_index_2
#    position_3 = board[win_index_3] # load the value of the board at win_index_3
#
#    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
#      return win_combination # return the win_combination indexes that won.
#    end
#  end
#  return false
#end

#def full?(board)
#  board.include?(" ") == false
#end

#def draw?(board)
#  if won?(board) == false && full?(board) == true
#  true
#  end
#end

#def over?(board)
#<<<<<<< HEAD
#  draw?(board) == true || won?(board) != false
#=======
#  draw?(board) == true || won?(board).is_a?(Array)
#>>>>>>> 13c52a2e7dafd539a424d0ca4706a538a69d9573
#end

#def winner(board)
#  if won?(board).is_a?(Array)
#    return board[won?(board)[0]]
#  else
#    nil
#  end
#end
#
#def play(board)
#  until over?(board) == true
#    turn(board)
#  end
#  if winner(board) != nil
#    puts "Congratulations #{winner(board)}!"
#  end
#  if draw?(board) == true
#    puts "Cat's Game!"
#  end
#end
