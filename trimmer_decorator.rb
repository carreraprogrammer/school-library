require './decorator'

class TrimmerDecorator < Decorator
  attr_accessor :nameable_obj

  def correct_name
    name = @nameable_object.correct_name
    if name.length > 9
      name[0, 9]
    else
      name
    end
  end
end
