class Tile
  attr_reader :value, :given

  def initialize(val)
    @value = val
    @given = (val != 0)
  end

  def to_s
    @given ? @value : "_"
  end
end
