require_relative 'student'
require_relative 'teacher'

class PersonOptions
  attr_accessor :people, :people_objects

  def initialize
    @people = []
    @people_objects = []
  end

  def teacher_to_object(teacher)
    {
      name: teacher.name,
      age: teacher.age,
      specialization: teacher.specialization
    }
  end

  def student_to_object(student)
    {
      name: student.name,
      age: student.age,
      classroom: student.classroom
    }
  end

  def list_all_people
    if @people.empty?
      puts "\nThere are no people to show you, but you can add some records!"
    else
      puts "\nWe have #{@people.count} people to show you\n"
      @people.each do |person|
        if person.is_a?(Student)
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, classroom: #{person.classroom}"
        else
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_a_student
    print 'Classroom: '
    classroom = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @people.push(student)
    @people_objects.push(student_to_object(student))
    puts "\nStudent created successfully ! "
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    @people_objects.push(teacher_to_object(teacher))
    puts "\nProfesor created successfully !"
  end
end
