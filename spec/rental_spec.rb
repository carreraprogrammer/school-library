require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:book) { Book.new('The Lord of the Rings', 'J. R. R. Tolkien') }
  let(:person) { Person.new(17, 'John Doe', 1) }
  let(:rental) { Rental.new('2021-01-01', book, person) }

  context 'initialize' do
    it 'sets the date correctly' do
      expect(rental.date).to eq '2021-01-01'
    end

    it 'sets the book correctly' do
      expect(rental.book).to eq book
    end

    it 'sets the person correctly' do
      expect(rental.person).to eq person
    end
  end

  context 'When book is not an instance of Book class' do
    it 'raises an error' do
      error = 'Book should be an instance of Book class'
      expect { Rental.new('2021-01-01', 'The Lord of the Rings', person) }.to raise_error(error)
    end
  end

  context 'When book already was rented in that date' do
    it 'raises an error' do
      Rental.new('2021-01-01', book, person)
      error = 'The book already was rented in that date'
      expect { Rental.new('2021-01-01', book, person) }.to raise_error(error)
    end
  end

  context 'When person is not an instance of Person class' do
    it 'raises an error' do
      invalid_person = 'John Doe'
      error = 'Person should be an instance of Person class'
      expect { Rental.new('2021-01-01', book, invalid_person) }.to raise_error(error)
    end
  end
end
