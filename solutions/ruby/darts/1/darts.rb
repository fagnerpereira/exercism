# out - 0 points
# outer circle - 1 point
# middle - 5
# inner - 10

class Darts
  RADIUS = {
    outer: 10,
    middle: 5,
    inner: 1
  }
  
  def initialize(x, y)
    @x, @y = x, y
  end

  def score
    d = Math.sqrt((x ** 2) + (y ** 2))
    return 0 if d > RADIUS[:outer]
    return 1 if d > RADIUS[:middle]
    return 5 if d > RADIUS[:inner]
    10 if d <= RADIUS[:inner]
  end
  
  private

  attr_accessor :x, :y
end