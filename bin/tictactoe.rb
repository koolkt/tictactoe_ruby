#!/bin/env ruby
require_relative 'Engine.rb'
require_relative 'Board.rb'
require_relative 'Graphics.rb'

b = Board.new(3,3)
r = Graphics.new()
engine = Engine.new(b,r)
engine.run()
