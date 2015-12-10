#!/bin/env ruby

# Note: separate logic in logic class

b = Board.new(3,3)
r = Graphics.new()
engine = Engine.new(b,r)
engine.run()
