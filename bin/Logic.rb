class Logic

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
    return "continue"
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

end
