class BooksEnumerable
  def initialize(books)
    @books = books
  end

  def enumerate_all_books
    counter_books = 0
    @books.books.each do |book|
      puts "#{counter_books}) Title: \"#{book.title}\", Author: #{book.author}"
      counter_books += 1
    end
  end
end
