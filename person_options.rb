require_relative 'student'

class PersonOptions
  def initialize
    @people = []
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
    print "Classroom: "
    classroom = gets.chomp
    print "Age: "
    age = gets.chomp
    print "Name: "
    name = gets.chomp
    print "Has parent permission? [Y/N]: "
    parent_permission = gets.chomp
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @people.push(student)
    puts "\nPerson created successfully ! "
  end
end
