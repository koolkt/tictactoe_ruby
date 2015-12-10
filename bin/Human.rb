class Human < Actor
  def initialize(name)
    super(name)
    @symbol = 'O'
    @message = "Player #{@name} enter move:"
  end
  attr_reader :name,:symbol,:message
  def get_move(node)
    input = gets.chomp.split(' ')
    return input
  end
end
