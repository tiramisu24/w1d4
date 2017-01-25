require_relative 'tile'

class Board

  attr_reader :grid
  TARGET_LINE = (1..9).to_a

  def self.from_file(filename)
    grid = File.readlines(filename).map { |row| row.chomp.split("").map(&:to_i) }
    Board.new(grid)
  end

  def initialize(grid)
    @grid = grid.map do |row|
      row.map do |el|
        Tile.new(el)
      end
    end
  end

  def update_tile(pos, value)
    @grid[pos[0]][pos[1]] = Tile.new(value) unless @grid[pos[0]][pos[1]].given
  end

  def solved?
      all_lines = rows + columns + boxes
      all_lines.all?{|el| line_solved?(el)}
  end

  def full?
    @grid.all?{ |row| row.all? {|item| item.value != 0} }
  end

  def rows
    @grid.map { |row| row.map { |item| item.value }  }
  end

  def columns
    @grid.transpose.map { |row| row.map { |item| item.value }  }
  end

  def boxes
    final = Array.new(9)
    new_grid = @grid.map { |row| row.map { |item| item.value }  }.flatten

    b = []
    3.times do
      (0...3).each do |i|
        box = []
        box.concat(new_grid[(i*3)...(i*3+3)])
        box.concat(new_grid[(i*3+9)...(i*3+12)])
        box.concat(new_grid[(i*3+18)...(i*3+21)])
        b << box
      end
      new_grid.slice!(0...27)
    end
    b
  end

  def line_solved?(arr)
    return true if arr.sort == TARGET_LINE
  end

  def render
    @grid.map { |row| row.map(&:to_s).join(" ") }.join("\n")
  end
end

if __FILE__ == $PROGRAM_NAME
  #b = Board.from_file('sudoku_almost_there.txt')
  #puts b.render
  #puts b.solved?
  #puts b.boxes.map { |row| row.to_s}.to_s
end
