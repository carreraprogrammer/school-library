require_relative 'book_options'
require_relative 'person_options'
require_relative 'rental_options'

class App
  def initialize(options)
    @options = options
    @book_options = BookOptions.new
    @person_options = PersonOptions.new
    @rental_options = RentalOptions.new(@book_options, @person_options)
  end

  def select_option(user_response)
    case user_response
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_by_id
    else
      puts 'Please add a valid number'
    end
  end

  private

  def list_all_books
    @book_options.list_all_books
  end

  def list_all_people
    @person_options.list_all_people
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
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
