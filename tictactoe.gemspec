# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "tictactoe"
  spec.version       = '1.0'
  spec.authors       = ["koolkat"]
  spec.email         = ["admin@koolkat.io"]
  spec.summary       = %q{Tic-tac-toe game with a minmax AI}
  spec.description   = %q{Tic-tac-toe game with a minmax AI}
  spec.homepage      = "http://koolkat.io"
  spec.license       = "MIT"

  spec.executables   = ['bin/tictactoe']
  spec.test_files    = ['tests/test_tictactoe.rb']
  spec.require_paths = ["lib"]
end
