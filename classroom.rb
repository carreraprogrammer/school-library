class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    raise 'This is not a student!' unless student.is_a?(Student)
    raise 'This student is already in this classroom!' if @students.include?(student)

    @students.push(student)
    student.classroom = self
  end
end
