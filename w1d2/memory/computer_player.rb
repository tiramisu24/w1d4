require_relative "board"
class ComputerPlayer
  attr_reader :known_values, :matched_cards, :best_guess
  def initialize
    # @own_board = Board.new
    # @max_guess = own_board.num_cards #?
    @max_guess = 20
    @known_values = {}
    @min_guess = 0
    @matched_cards = []
    @best_guess = nil
  end

  def get_input
    if @best_guess
      my_choice = @best_guess.dup
      @best_guess = nil
    else
      choices = (@min_guess...@max_guess).to_a.select{ |x| !@matched_cards.include?(x)}
      my_choice = choices.sample(2)
    end
    "#{my_choice[0]}, #{my_choice[1]}"
  end

  def recieve_revealed_card(pos, value)
    if @known_values.has_value?(value)
      @best_guess = [pos, @known_values.key(value)]
    else
      @known_values[pos] = value
    end
  end

  def receive_match(pos1, pos2)
    @matched_cards << pos1
    @matched_cards << pos2
  end
end
