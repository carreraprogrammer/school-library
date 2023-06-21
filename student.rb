require './person'

class Student < Person
  attr_accessor :specialization

  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

daniel = Student.new("16b", 16, "Daniel", false)

puts daniel.play_hooky