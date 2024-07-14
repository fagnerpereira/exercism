class Dice
  SIDES = [1, 2, 3, 4, 5, 6]

  def self.roll
    SIDES.sample
  end
end

class DndCharacter
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  def initialize
    @strength = generate_score
    @dexterity = generate_score
    @constitution = generate_score
    @intelligence = generate_score
    @wisdom = generate_score
    @charisma = generate_score
  end

  def hitpoints
    10 + DndCharacter.modifier(constitution)
  end

  def generate_score
    score = []
    score << Dice.roll
    score << Dice.roll
    score << Dice.roll
    score << Dice.roll
    min = score.min
    score.sum - min
  end

  def self.modifier(score)
    (score - 10) / 2
  end
end
