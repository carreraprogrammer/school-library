class PeopleEnumerable
  def initialize(people)
    @people = people
  end

  def enumerate_all_people
    counter_people = 0
    @people.people.each do |person|
      if person.is_a?(Student)
        puts "#{counter_people}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age},
          classroom: #{person.classroom}"
      else
        puts "#{counter_people}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      counter_people += 1
    end
  end
end
