require_relative 'book_options'

class App
  def initialize(options)
    @options = options
    @book_options = BookOptions.new
  end

  def select_option(user_response)
    if user_response == 1
      @book_options.list_all_books
    else
      puts "\nYou have selected #{user_response}"
    end
  end
end
