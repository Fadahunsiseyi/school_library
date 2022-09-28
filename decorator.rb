require_relative './nameable'
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    word_output = @nameable.correct_name
    if word_output.length <= 10
      word_output
    else
      word_output[0..9]
    end
  end
end
