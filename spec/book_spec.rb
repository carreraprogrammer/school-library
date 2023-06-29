require_relative '../book'
require_relative '../person'

RSpec.describe Book do
  let(:book) { Book.new('The Lord of the Rings', 'J. R. R. Tolkien') }
  let(:rental_date) { '2017-05-01' }
  let(:person) { Person.new(17, 'John Doe', 1) }

  context "initialization" do
    it "sets the title correctly" do
      expect(book.title).to eq 'The Lord of the Rings'
    end

    it "sets the author correctly" do
      expect(book.author).to eq 'J. R. R. Tolkien'
    end

    it "initializes rentals as an empty array" do
      expect(book.rentals).to be_empty
    end
  end

  context "renting a book" do
    it "adds a rental to the rentals array" do
      book.rent_book(rental_date, person)
      expect(book.rentals.size).to eq 1
    end

    it "stores the rental with the correct date and person" do
      book.rent_book(rental_date, person)
      rental = book.rentals.first
      expect(rental.date).to eq rental_date
      expect(rental.person).to eq person
    end
  end

  context "setters" do
    it "sets the title correctly" do
      book.title = 'New Title'
      expect(book.title).to eq 'New Title'
    end

    it "sets the author correctly" do
      book.author = 'New Author'
      expect(book.author).to eq 'New Author'
    end
  end
end
