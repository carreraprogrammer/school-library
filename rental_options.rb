require_relative 'person_options'
require_relative 'book_options'
require_relative 'rental'

class RentalOptions
  def initialize(books, people)
    @rentals = []
    @books = books
    @people = people
  end

  def create_a_rental
    puts "\nPlease, select a book from the following list by number: "
    list_all_books
    selected_book = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    list_all_people
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

  def list_all_books
    counter_books = 0
    @books.books.each do |book|
      puts "#{counter_books}) Title: \"#{book.title}\", Author: #{book.author}"
      counter_books += 1
    end
  end

  def list_all_people
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

  def create_rental(book_index, person_index, date)
    book = @books.books[book_index]
    person = @people.people[person_index]
    @rentals.push(Rental.new(date, book, person))
    puts 'Rental created successfully'
  end
end
