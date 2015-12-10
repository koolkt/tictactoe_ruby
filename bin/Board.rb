class Board
  @board = []
  def initialize(x,y)
    @x = x
    @y = y 
    @board = [["_","_","_"],
              ["_","_","_"],
              ["_","_","_"]]
  end
  attr_reader :board
  def update_board(symbol, place)
    x,y = place
    @board[y.to_i][x.to_i] = symbol
    return @board
  end
end
