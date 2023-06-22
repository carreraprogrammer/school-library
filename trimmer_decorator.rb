require_relative 'decorator'

class TrimmerDecorator < Decorator
  attr_accessor :nameable_obj

  def correct_name
    name = @nameable.correct_name
    if name.length > 10
      name[0, 10]
    else
      name
    end
  end
end
