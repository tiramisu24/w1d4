class Card

  attr_reader :value, :face_up

  def initialize(value)
    @value  = value
    @face_up = false
  end

  def show
    @face_up ? @value : "*"
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(other_card)
    other_card.value == @value
  end

  def to_s
    "|#{show}|"
  end

end
