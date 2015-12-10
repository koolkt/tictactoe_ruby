require_relative 'Human.rb'
require_relative 'Robot.rb'
require_relative 'Logic.rb'

class Engine
  def initialize(b,r)
    @board = b
    @graphics = r
    @logic = Logic.new()
  end

  def run()
    player1_name = ask_name()
    @player1 = Human.new(player1_name)
    @player2 = Robot.new("Robot", @logic)
    current = @player1
    main_loop(current)
  end
  
  def main_loop(current_player)
    @graphics.render(@board.board)
    move = current_player.get_move(@board.board)
    result = @logic.make_move(@board,move,current_player.symbol)
    main_loop(current_player) unless result == 'ok'
    state = @logic.is_gameover(@board.board)
    if state == "continue"
      current_player = current_player == @player1 ? @player2 : @player1
      main_loop(current_player)
    end
    @graphics.render(@board.board)
    message = state == '-' ? "draw" : "player #{current_player} wins"
    puts "Game over #{message}!"
    exit
  end

  def ask_name()
    puts "Enter your name"
    return gets.chomp
  end
end

