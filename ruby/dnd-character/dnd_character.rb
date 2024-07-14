class Dice
  SIDES = [1, 2, 3, 4, 5, 6].freeze

  def self.roll
    SIDES.sample
  end
end

class DndCharacter
  ATTRIBUTES = %i[strength dexterity constitution intelligence wisdom charisma].freeze

  attr_reader *ATTRIBUTES

  def initialize
    ATTRIBUTES.each do |attribute|
      instance_variable_set("@#{attribute}", generate_score)
    end
  end

  def hitpoints
    10 + DndCharacter.modifier(constitution)
  end

  def generate_score
    rolls = Array.new(4) { Dice.roll }
    rolls.sum - rolls.min
  end

  def self.modifier(score)
    (score - 10) / 2
  end
end
