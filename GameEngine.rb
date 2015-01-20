require_relative "./Board"
require_relative "./Player"

class GameEngine

	def initialize
	  @human_player = Player.new('x')
	  @computer_player = Player.new('o')
	  @current_player = @human_player
	  @board = Board.new
	  @human_player_move = 0
	end
  # Check if the player had won or not 
  # @return [Bool] true if won, false otherwise .
  def won?
		# @todo the player should win if he got 3x cells in a row, column cells, diagonal cells
		# Check the rows, columns, and diagonals if they = the player * 3 
    # [o,2,3,4,o,6,7,8,o] 

	end

	  # Give a score to the player, 10 if he won, -10, if he lost, 0 if draw.
    # @note This method will help with the minMax algorithm
    # @return [Fixnum] the value of the score.
	def player_score
  end

  # Start the game.
  # @todo loop until game is over
	def play_game
		puts "\n******** WELCOME TO TIC TAC TOE GAME *********\n"
    puts "\t\tLet's Play *_*\n\n"
    @board.draw_board()
    human_player_move()
    @board.draw_board()
	end

  # Check if the game is over by checking if a player had won or it was draw.
  # @return [bool] true if full, false otherwise.
	def game_over?
	  # @todo check if current_player.won? or if board.board_full? 
	  #   (hmmmm we can use score instead of these 2 methods)
	end

  # Check if the game is over by checking if a player had won or it was draw.
  # @return [Array<Fixnum>] Array of all the empty cells.
	def get_available_moves
		# @todo Check the empty cells on board and store them in an array 
		#   board.empty? should help
	end

  # Get the player input
  # @todo The player move must be one of the available_moves 
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
      @board.board[@human_player_move] = "x"
      # puts @board.board
      # if get_available_moves.include?(player_move)
      #   return player_postion.to_i
      # else 
      #   puts 'That position is already taken -_-'
      #   human_player_move()
      # end # inner if end
    else
      puts 'That is not a number -_-'
      human_player_move()
	  end # outer if end
  end

  # Decide what is the best move so the computer player wins
	def computer_next_move(move)
		# How many available moves we have (Based on that we will generate the tree)
    # Try every move and a new state(new state of the board) will be generated 
    # Assign a score for each state
    # Check the current player
    #   If computer player, give it the max score 
    #   If the human player, give it the min score 
	end

end # class Game end 

game = GameEngine.new 
game.play_game

