require_relative 'person_options'
require_relative 'book_options'
require_relative 'rental'
require_relative 'people_enumerable'
require_relative 'books_enumerable'
require_relative 'student'

class RentalOptions
  attr_accessor :rentals, :rentals_objects

  def initialize(books, people)
    @rentals = []
    @books = books
    @people = people
    @rentals_objects = []
  end

  def fill_rentals
    @rentals_objects.each do |rental|
      book = Book.new(rental['title'], rental['author'])
      person = if rental['type'] == 'student'
                 Student.new(rental['classroom'], rental['age'], rental['name'], rental['id'],
                             parent_permission: rental['parent_permission'])
               else
                 Teacher.new(rental['specialization'], rental['age'], rental['name'], rental['id'])
               end
      new_rental = Rental.new(rental['date'], book, person)
      @rentals.push(new_rental)
    end
  end

  def rental_to_object(rental)
    rental_object = {
      date: rental.date,
      title: rental.book.title,
      author: rental.book.author,
      name: rental.person.name,
      age: rental.person.age,
      id: rental.person.id
    }

    if rental.person.is_a?(Student)
      rental_object['classroom'] = rental.person.classroom
      rental_object['parent_permission'] = rental.person.parent_permission
    else
      rental_object['specialization'] = rental.person.specialization
      rental_object['parent_permission'] = 'Y'
    end

    rental_object
  end

  def create_a_rental
    puts "\nPlease, select a book from the following list by number: "
    BooksEnumerable.new(@books).enumerate_all_books
    selected_book = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    PeopleEnumerable.new(@people).enumerate_all_people
    selected_person = gets.chomp.to_i

    print 'Date(YYYY-MM-DD): '
    date = gets.chomp

    create_rental(selected_book, selected_person, date)
  end

  def rental_by_id
    print 'ID of person: '
    person_id = gets.chomp.to_i
    filtered_rentals = @rentals.filter { |rental| rental.person.id == person_id }
    puts 'Rentals: '
    filtered_rentals.each { |rental| puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" }
  end

  private

  def create_rental(book_index, person_index, date)
    book = @books.books[book_index]
    person = @people.people[person_index]
    new_rental = Rental.new(date, book, person)
    @rentals.push(new_rental)
    @rentals_objects.push(rental_to_object(new_rental))
    puts 'Rental created successfully'
  end
end
