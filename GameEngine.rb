require_relative "./Board"
require_relative "./Player"

class GameEngine

	def initialize
	  @human_player = Player.new('x').player
	  @computer_player = Player.new('o').player
	  @current_player = ''
	  @board = Board.new
	  @human_player_move = 0
	end

  # Check if the player had won or not 
  # I got this code from this source: http://ow.ly/HEUYS
  # @return [String] the winner player o or x. If no one wins, return empty string.
  def get_winner(player)
    wins = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
    [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
    [0, 4, 8], [2, 4, 6]]             # <-- Diagonal wins

    if wins.any? { |line| line.all? { |cell| @board.board[cell] == player} }
      return winner = player
    end

    return winner = ''
	end
  
	  # Give a score to the player, 10 if he won, -10, if he lost, 0 if draw.
    # @note This method will help with the minMax algorithm
    # @return [Fixnum] the value of the score.
	def player_score
    if get_winner('o').eql? (@computer_player)
      return 10
    elsif get_winner('x').eql? (@human_player)
      return -10
    else 
      return 0
    end
  end

  # Start the game.
  # @todo loop until game is over
	def play_game
		puts "\n******** WELCOME TO TIC TAC TOE GAME *********\n"
    puts "\t\tLet's Play *_*\n\n"
     while !game_over?
      @board.draw_board()
      human_player_move()
      # @note this is added just for testing becuse the best_computer_move is not added yet
      # moves = get_available_moves
      # if !moves.empty?
      #    computer_next_move(moves[0])
      # end
      @board.draw_board()
    end
    # end

	end

  # Check if the game is over by checking if a player had won or it was draw(board is full).
  # @return [bool] true if it's over, false otherwise.
	def game_over?
    if @board.board_full? || get_winner('o') == 'o' || get_winner('x') == 'x'
      return true
    else
      return false
    end
	end

  # Check the available moves that the player can choose from.
  # @return [Array<Fixnum>] Array of all the available moves.
	def get_available_moves
    available_moves = []
    @board.board.each_index do |i|
      if @board.board[i].empty?
        available_moves.push(i)
      end # if end 
    end # each_index end
    return available_moves
	end

  # Get the player input
  # @note The commented code below will work after adding get_available_moves method)
	def human_player_move
    @current_player = @human_player 
    print 'Choose your position on the board: (1-9) '
    player_input = gets.chomp
    # Incase the user entered a number with more than 1 digits  
    player_move = player_input[0]
    invalid_input = /[a-z]/.match(player_move) 
    if invalid_input.nil? && !player_input.empty?
      @human_player_move = player_move.to_i - 1
      if get_available_moves.include?(@human_player_move)
        @board.board[@human_player_move] = @human_player
      else 
        puts 'That position is already taken -_-'
        human_player_move()
      end # inner if end
    else
      puts 'That is not a number -_-'
      human_player_move()
	  end # outer if end
  end

  # Add the computer move to the board 
	def computer_next_move(move)
    @current_player = @computer_player
    @board.board[move] = @computer_player
	end

  # Decide what is the best move so the computer_player wins (MiniMax Algorithm)
  def best_computer_move
    # @todo How many available moves we have (Based on that we will generate the tree)
    # Try every move and a new state(new state of the board) will be generated 
    # Assign a score for each state
    # Check the current player
    #   If computer player, give it the max score 
    #   If the human player, give it the min score 
  end

end # class Game end 

game = GameEngine.new 
game.play_game

