require_relative 'card'

class Board
  NUM_CARDS = 20

  attr_reader :grid, :num_cards

  def initialize
    @grid =[]
    @num_cards = NUM_CARDS

  end

  def populate
    values = ((1 .. NUM_CARDS/2).to_a * 2).shuffle
    values.each { |val| @grid << Card.new(val) }
  end

  def render
    @grid.map { |card| card.to_s }.join(" ")
  end

  def won?
    @grid.all? { |card| card.face_up }
  end

  def reveal(pos)
    @grid[pos].reveal unless @grid[pos].face_up
    @grid[pos].value
  end


  def [](pos)
    @grid[pos]
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.populate
  puts b.render
end
