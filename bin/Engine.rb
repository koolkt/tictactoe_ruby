class Engine
  def initialize(b,r)
    @board = b
    @graphics = r
    @n_players = 0
  end

  def run()
    puts "Welcome, please enter the number of human players [1/2]"
    loop do
      @n_players = gets.chomp
      if @n_players =~ /^[1-2]{1}$/
        break
      else
        puts "You must enter either 1 or 2"
      end
    end
    if @n_players == "1"
      player1_name = ask_name("player 1")
      @player1 = Human.new(player1_name)
      @player2 = Robot.new("Robot", logic)
    else
      player1_name = ask_name("player 1")
      player2_name = ask_name("player 2")
      @player1 = Human.new(player1_name)
      @player2 = Human.new(player2_name)
    end
    current = @player1
    loop do
      @graphics.render(@board.board)
      puts current.message
      move = current.get_move(@board.board)
      result = make_move(@board,move,current.symbol)
      winner = is_gameover(@board.board)
      if result == "ok" and not winner
        current = current == @player1 ? @player2 : @player1
      elsif winner
         @graphics.render(@board.board)
         res = winner == '-' ? "draw" : "player #{current} wins"
        puts "Game over #{res}!"
        break
      else
        puts "Ilegal move reason #{result}"
      end        
    end
  end

  def is_move_legal(board, move)
    x,y = move
    return board.board[y][x] == '_'
  end

  def make_move(board, move, player)
    x,y = move
    move = [x.to_i,y.to_i]
    if not is_move_legal(board, move)
      return "ko"
    end
    board.update_board(player, move)
    return "ok"
  end

  def ask_name(player)
    puts "Enter player #{player} name"
    return gets.chomp
  end

  def is_gameover(node)
    (0..2).each do |i|
      if node[i][0] == node[i][1] && node[i][1] == node[i][2]
        return node[i][0] unless node[i][0] == "_"
      elsif node[0][i] == node[1][i] && node[1][i] == node[2][i]
        return node[0][i] unless node[0][i] == "_"
      end
    end

    if ( node[0][0] == node[1][1] && node[1][1] == node[2][2] ) ||
       ( node[0][2] == node[1][1] && node[1][1] == node[2][0] )
      return node[1][1] unless node[1][1] == "_"
    end
    return "-" unless node.join.split('').include?("_")
    return false
  end
end
