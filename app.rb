require_relative 'book_options'
require_relative 'person_options'

class App
  def initialize(options)
    @options = options
    @book_options = BookOptions.new
    @person_options = PersonOptions.new
  end

  def select_option(user_response)
    case user_response
    when 1
      @book_options.list_all_books
    when 2
      @person_options.list_all_people
    when 3
      puts
      print "Do you want to create a student (1) or a teacher (2) ? [Input the number]: "
      select_person = gets.chomp.to_i
      if select_person == 1
        @person_options.create_a_student
      elsif select_person == 2
        @person_options.create_a_teacher
      end
    when 4
      puts ''
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      @book_options.create_new_book(title, author)
    else
      puts "\nYou have selected #{user_response}"
    end
  end
end
