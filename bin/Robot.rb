require_relative 'Actor.rb'

class Robot < Actor
  def initialize(name,logic)
    super(name)
    @symbol = 'X'
    @message = "#{@name} is computing the result..."
    @logic = logic
  end

  attr_reader :name,:symbol,:message

  def get_move(node)
    puts @message
    posible_values = []
    pm = posible_moves(node,'X')
    for move,posible_node in pm
      value = minimax(posible_node,0,false)
      if value == 1
        return move
      end
      posible_values << [value,move]
    end
    return posible_values.max[1]
  end

  def gen_state(x,y,board,s)
    b = Marshal.load( Marshal.dump(board) )
    b[y][x] = s
    return b
  end

  def valid_moves(node)
    result = []
    y = 0
    for row in node
      free_boxes = row.each_index.select{|i| row[i] == '_'}
      for x in free_boxes
        result << [x,y]
      end
      y += 1
    end
    return result
  end

  def posible_moves(node,s)
    list_of_boards = []
    moves = valid_moves(node)
    for x,y in moves
      b = gen_state(x,y,node,s)
      list_of_boards << [[x,y],b]
    end
    return list_of_boards
  end

  def minimax(node, depth, is_maximazing_player)
    s = is_maximazing_player ? 'X': 'O'
    state = @logic.is_gameover(node)
    if state != 'continue'
      return 0 unless state != '-'
      return state == 'X' ? 1 : -1
    end
    if is_maximazing_player
      best_value = -100
      pms = posible_moves(node,s)
      for move,posible_node in pms
        val = minimax(posible_node, depth + 1, false)
        best_value = [best_value, val].max
      end
    else
        best_value = 100
        pms = posible_moves(node,s)
        for move,posible_node in pms
            val = minimax(posible_node, depth + 1, true)
            best_value = [best_value, val].min
        end
    end
    return best_value
  end
end
