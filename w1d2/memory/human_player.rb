require_relative 'board'

class HumanPlayer
  def get_input
    puts "Take a guess: card1,card2"
    gets.chomp
  end

  def recieve_revealed_card(pos, value)
    nil
  end

  def receive_match(pos1, pos2)
    nil
  end


end
