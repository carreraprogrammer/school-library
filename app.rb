require_relative 'book_options'
require_relative 'person_options'
require_relative 'rental_options'
require_relative 'storage'
require 'json'

class App
  def initialize(options)
    @options = options
    @book_options = BookOptions.new
    @person_options = PersonOptions.new
    @rental_options = RentalOptions.new(@book_options, @person_options)
    @storage = Storage.new('json', './db/')
    @book_options.books_objects = @storage.load_data('books')
    @person_options.people_objects = @storage.load_data('people')
    @rental_options.rentals_objects = @storage.load_data('rentals')
    @person_options.fill_people if @person_options.people.empty?
    @book_options.fill_books if @book_options.books.empty?
    @rental_options.fill_rentals if @rental_options.rentals.empty?
  end

  def store_json_data()
    books_objects = @book_options.books_objects
    person_objects = @person_options.people_objects
    rentals_objects = @rental_options.rentals_objects

    @storage.save_data('books', books_objects)
    @storage.save_data('people', person_objects)
    @storage.save_data('rentals', rentals_objects)
  end

  def check_cases_first(user_response)
    case user_response
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    else
      check_cases_second(user_response)
    end
  end

  def check_cases_second(user_response)
    case user_response
    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_by_id
    when 7
      store_json_data
    else
      puts 'Please add a valid number'
    end
  end

  def select_option(user_response)
    check_cases_first(user_response)
  end

  private

  def list_all_books
    @book_options.list_all_books
  end

  def list_all_people
    @person_options.list_all_people
  end

  def create_person
    print 'Do you want to create a new student (1) or a teacher (2)? [Input the number]: '
    select_person = gets.chomp.to_i
    case select_person
    when 1
      @person_options.create_a_student
    when 2
      @person_options.create_a_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book_options.create_new_book(title, author)
  end

  def create_rental
    @rental_options.create_a_rental
  end

  def rental_by_id
    @rental_options.rental_by_id
  end
end
