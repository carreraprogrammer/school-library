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
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end
end
