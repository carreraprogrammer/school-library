require_relative 'book_options'

class App
  def initialize(options)
    @options = options
    @book_options = BookOptions.new
  end

  def select_option(user_response)
    case user_response
    when 1
      @book_options.list_all_books
    when 4
      puts ""
      print "Title: "
      title = gets.chomp
      print "Author: "
      author = gets.chomp
      @book_options.create_new_book(title, author)
    else
      puts "\nYou have selected #{user_response}"
    end
  end
end
