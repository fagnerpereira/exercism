module TwoFer
  SENTENCE = "One for %<name>s, one for me.".freeze
  
  def two_fer(name = "you")
    format(SENTENCE, name: name)
  end

  module_function :two_fer
end