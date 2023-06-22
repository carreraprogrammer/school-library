require_relative 'book'

class BookOptions
  def initialize
    @books = []
  end

  def list_all_books
    if @books.empty?
      puts "There are not books to show you, add some records!"
    else
      puts "We have #{@books.count} to show you"
      @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}"}
    end
  end
end