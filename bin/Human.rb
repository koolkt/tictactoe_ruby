require_relative 'Actor.rb'

class Human < Actor
  def initialize(name)
    super(name)
    @symbol = 'O'
    @message = "#{@name} enter your move (1 1):"
  end
  attr_reader :name,:symbol,:message
  def get_move(node)
    input = 0
    loop do
      puts @message
      input = gets.chomp
      if input =~ /^[0-2]{1} [0-2]{1}$/
        break
      else
        puts "Invalid selection"
      end
    end
    return input.split(' ')
  end
end
