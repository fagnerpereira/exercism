class Darts
  SCORE_ZONES = [
    {radius: 1, score: 10},
    {radius: 5, score: 5},
    {radius: 10, score: 1},
    {radius: Float::INFINITY, score: 0}
  ]

  def initialize(x, y)
    @distance = Math.hypot(x, y)
  end

  def score
    SCORE_ZONES.find do |zone|
      @distance <= zone[:radius]
    end[:score]
  end
end