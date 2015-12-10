class Graphics
  def render(b)
    puts "   0  1  2"
    puts " -----------"
    puts "0 #{b[0].join(' | ')}"
    puts " -----------"
    puts "1 #{b[1].join(' | ')}"
    puts " -----------"
    puts "2 #{b[2].join(' | ')}"
  end
end
