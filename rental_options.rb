require_relative 'person_options'
require_relative 'book_options'
require_relative 'rental'
require_relative 'people_enumerable'
require_relative 'books_enumerable'

class RentalOptions
  def initialize(books, people)
    @rentals = []
    @books = books
    @people = people
    @rentals_objects = []
  end

  def rental_to_object(rental)
    {
      date: rental.date,
      book: rental.book,
      person: rental.person
    }
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
    @rentals.push(Rental.new(date, book, person))
    @rentals_objects.push(rental_to_object(Rental.new(date, book, person)))
    puts 'Rental created successfully'
  end
end
