require_relative "./Cell"


class Board

  attr_reader :board

	def initialize
		@board = [Cell.new().cell] * 9
	end	

  # Draw the board on the terminal #{@board[0]}
  # @todo Think of a better way to draw the baord
  def draw_board
    puts "\t#{@board[0]}\t|\t#{@board[1]}\t|\t#{@board[2]}"
    puts "\t\t|\t\t|\t"
    puts "\t-------------------------------------"
    puts "\t#{@board[3]}\t|\t#{@board[4]}\t|\t#{@board[5]}"
    puts "\t\t|\t\t|\t"
    puts "\t-------------------------------------"   
    puts "\t#{@board[6]}\t|\t#{@board[7]}\t|\t#{@board[8]}"
    puts "\t\t|\t\t|\t"
    puts "\t-------------------------------------"
	end

  # Check if all cells in the board are all empty.
  # @return [bool] true if empty, false otherwise.
  def board_empty?
		# @todo check each all cell
	end

  # Check if all cells in the board are all full.
  # @return [bool] true if full, false otherwise.
	def board_full?
    # @todo check each all cell
	end

end # class Board end 
