require_relative 'student'
require_relative 'teacher'

class PersonOptions
  attr_accessor :people, :people_objects

  def initialize
    @people = []
    @people_objects = []
  end

  def fill_people
    @people_objects.each do |person|
      if person['type'] == 'student'
        student = Student.new(person['classroom'], person['age'], person['name'], parent_permission: person['parent_permission'])
        @people.push(student)
      else
        teacher = Teacher.new(person['specialization'], person['age'], person['name'])
        @people.push(teacher)
      end
    end
  end

  def teacher_to_object(teacher)
    {
      name: teacher.name,
      age: teacher.age,
      specialization: teacher.specialization,
      parent_permission: "Y",
      type: 'teacher',
      id: teacher.id
    }
  end

  def student_to_object(student)
    student_object ={
      name: student.name,
      age: student.age,
      classroom: student.classroom,
      parent_permission: student.parent_permission,
      type: 'student',
      id: student.id
    }
  end

  def list_all_people
    if @people.empty?
      puts "\nThere are no people to show you, but you can add some records!"
    else
      puts "\nWe have #{@people.count} people to show you\n"
      @people.each do |person|
        if person.is_a?(Student)
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, Classroom: #{person.classroom}"
        else
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, Specialization: #{person.specialization}"
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
    student = Student.new(classroom, age, name, generate_random_id, parent_permission: parent_permission)
    @people.push(student)
    @people_objects.push(student_to_object(student))
    puts "\nStudent created successfully!"
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name, generate_random_id)
    @people.push(teacher)
    @people_objects.push(teacher_to_object(teacher))
    puts "\nTeacher created successfully!"
  end

  def generate_random_id
    rand(1..1000)
  end
end
