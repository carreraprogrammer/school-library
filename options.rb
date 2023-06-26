require_relative 'app'

class Options
  def initialize
    @app = App.new(self)
    puts "\n~~ Welcome to school library app ~~\n"
    show_menu
  end

  def show_menu
    puts "\nPlease choose an option by entering a number:"
    puts "\n1 - List all books"
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n"
    user_response = gets.chomp.to_i
    if user_response < 7
      @app.select_option(user_response)
      sleep(1)
      show_menu
    elsif user_response == 7
      puts "\n~~ Thanks for use school library app ~~\n"
    else
      puts "\n~~ Please, insert a valid number ~~\n"
      sleep(1)
      show_menu
    end
  end
end
