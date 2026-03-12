class Darts
  RADIUS_SQUARED = {
    outer: 100,  # 10²
    middle: 25,  # 5²  
    inner: 1     # 1²
  }

  def initialize(x, y)
    @distance_squared = (x ** 2) + (y ** 2)
  end

  def score
    return 0 if @distance_squared > RADIUS_SQUARED[:outer]
    return 1 if @distance_squared > RADIUS_SQUARED[:middle]
    return 5 if @distance_squared > RADIUS_SQUARED[:inner]
    10
  end
end