class Engine
  def initialize(b,r)
    @board = b
    @graphics = r
  end

  def run()
    player1_name = ask_name("player 1")
    @player1 = Human.new(player1_name)
    @player2 = Robot.new("Robot", logic)
    current = @player1
    main_loop(current)
  end
  
  def main_loop(current)
    @graphics.render(@board.board)
    puts current.message
    move = current.get_move(@board.board)
    result = make_move(@board,move,current.symbol)
    puts "Ilegal move" and main_loop(current_player) unless result == 'ok'
    game_over = is_gameover(@board.board)
    if not game_over
      current_player = current_player == @player1 ? @player2 : @player1
      main_loop(current_player)
    end
    @graphics.render(@board.board)
    status = winner == '-' ? "draw" : "player #{current_player} wins"
    puts "Game over #{status}!"
  end

  def ask_name(player)
    puts "Enter player #{player} name"
    return gets.chomp
  end
end

