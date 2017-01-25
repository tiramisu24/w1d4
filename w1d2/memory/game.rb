require_relative 'card'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  def initialize(player)
    @board = Board.new
    @player = player
  end

  def play
    @board.populate
    until @board.won?
      @board.render
      guess = @player.get_input
      until valid_guess?(guess)
        guess = @player.get_input
      end
      guess = guess.split(",").map { |x| x.to_i }
      make_guess(*guess)


      sleep(2)
      system("clear")
    end
    puts "you won!"
  end

  def make_guess(pos1, pos2)
    @board[pos1].reveal
    @board[pos2].reveal
    puts @board.render

    if @board[pos1] != @board[pos2]
      @board[pos1].hide
      @board[pos2].hide
      @player.recieve_revealed_card(pos1, @board[pos1].value)
      @player.recieve_revealed_card(pos2, @board[pos2].value)

    else
      @player.receive_match(pos1,pos2)
    end
  end

  private
  def valid_guess?(guess)
    return false unless guess =~ /\d+,\s?\d+/
    guess = guess.split(",").map { |x| x.to_i }
    return guess.all? {|pos| pos >= 0 and pos < @board.num_cards}
  end

end

if __FILE__ == $PROGRAM_NAME
  diane = ComputerPlayer.new
  g = Game.new(diane)
  g.play
end
