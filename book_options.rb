require_relative 'book'

class BookOptions
  attr_accessor :books, :books_objects

  def initialize
    @books = []
    @books_objects = []
  end

  def fill_books
    @books_objects.each do |book|
      new_book = Book.new(book['title'], book['author'])
      @books.push(new_book)
    end
  end

  def to_object(book)
    {
      title: book.title,
      author: book.author
    }
  end

  def list_all_books
    if @books.empty?
      puts "\nThere are not books to show you, but you can add some records!"
    else
      puts "\nWe have #{@books.count} books to show you\n"
      @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
    end
  end

  def create_new_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
    @books_objects.push(to_object(new_book))
    puts 'Book created succesfully !'
  end
end
