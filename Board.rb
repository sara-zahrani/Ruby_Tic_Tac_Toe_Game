require_relative "./Cell"


class Board

	attr_reader :board

	def initialize
		@board = [Cell.new().cell_id] * 8
	end	

  # Draw the board on the terminal
  def draw_board
		# @todo draw the board 
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
