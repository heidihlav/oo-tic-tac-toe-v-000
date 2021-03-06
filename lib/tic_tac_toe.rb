class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def display_board
    puts " #{@board[0]} "   "|" " #{@board[1]} " "|"   " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} "   "|" " #{@board[4]} " "|"   " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} "   "|" " #{@board[7]} " "|"   " #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input, char = "X")
    @board[input] = char
  end

  def position_taken?(index)
    (@board[index] == " " || @board[index] == "" || @board[index] == nil) ?
      false : true
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turns = 0
    @board.each do |token|
      if token == "X" || token == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
        move(index, token)
        display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      position_taken?(win_combo[0])
      end
  end

  def full?
    WIN_COMBINATIONS.all? do |win_combo|
      @board[win_combo[0]] == "X" || @board[win_combo[0]] == "O"
      position_taken?(win_combo[0])
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @board[win_combo[0]]
    end
  end

  def play
    turn until over?
    win_player = winner
    if win_player == "X"
      puts "Congratulations X!"
    elsif win_player == "O"
      puts "Congratulations O!"
    else draw?
      puts "Cat\'s Game!"
    end
  end

end
