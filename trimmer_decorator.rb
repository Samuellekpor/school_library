require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.first(10)
  end
end
