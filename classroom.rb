class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    if student.is_a?(Student)
      if @students.include?(student)
        raise 'This student is already in this classroom!'
      else
        @students.push(student)
        student.classroom = self
      end
    else
      raise 'This is not a student!'
    end
  end  
end
