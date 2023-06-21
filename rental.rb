class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    raise 'Book should be an instance of Book class' unless book.is_a?(Book)
    raise 'The book already was rented in that date' if book.rentals.map(&:date).include?(date)
    raise 'Person should be an instance of Person class' unless person.is_a?(Person)

    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
    person.rentals.push(self)
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
