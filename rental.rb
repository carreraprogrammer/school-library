class Rental
  attr_accessor :date, :book

  def initialize(date, book)\
    raise 'Book should be an instance of Book class' unless book.is_a?(Book)
    raise 'Person should be an instance of Person class' unless person.is_a?(Person)
    raise 'The book already was rented in that date' if book.rentals.map(&:date).include?(date)

    @date = date
    @book = book
    book.rentals.push(self)
  end
end
