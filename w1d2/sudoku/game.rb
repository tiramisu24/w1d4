require 'colorize'
require_relative 'board'

class Game
  def initialize(filename)
    @board = Board.from_file(filename)
  end

  def play
    until @board.full?
      puts @board.render
      puts "Enter value, then row, then column"
      answer = gets.chomp
      until valid?(answer)
        puts "Invalid input; try again"
        answer = gets.chomp
      end
      answer = answer.split(/[, ]+/).map(&:to_i)
      @board.update_tile([answer[1], answer[2]], answer[0])
    end
    
    if @board.solved?
      puts @board.render.colorize(:green)
      puts "You solved it!"
    else
      puts @board.render.colorize(:red)
      puts "You lost!"
    end
  end

  def valid?(str)
    return str =~ /^([1-9]{1})[, ]+([0-8]{1})[, ]+([0-8]{1})$/
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new('sudoku_almost_there.txt')
  g.play
end
