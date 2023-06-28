require_relative 'person'

class Student < Person
  attr_accessor :specialization, :classroom, :parent_permission

  def initialize(classroom, age, name, id, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
