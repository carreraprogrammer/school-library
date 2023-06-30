require_relative '../person'

describe Person do
  let(:person) { Person.new(17, 'John Doe', 1) }

  context 'initialize' do
    it 'sets the name correctly' do
      expect(person.name).to eq 'John Doe'
    end

    it 'sets the age correctly' do
      expect(person.age).to eq 17
    end

    it 'sets the id correctly' do
      expect(person.id).to eq 1
    end

    it 'sets the parent_permission correctly' do
      expect(person.parent_permission).to eq true
    end

    it 'initializes rentals as an empty array' do
      expect(person.rentals).to be_empty
    end
  end

  context 'When add Rental instance' do
    let(:book) { Book.new('Fantastic Mr.Fox', 'Roald Dahl') }
    let(:rental) { Rental.new('2021-01-01', book, person) }

    it 'add rental to rentals array' do
      person.add_rental('2021-01-01', book)
      expect(person.rentals.size).to eq 1
    end
  end

  context 'setters' do
    it 'change the name correctly' do
      person.name = 'New Name'
      expect(person.name).to eq 'New Name'
    end

    it 'change the age correctly' do
      person.age = 18
      expect(person.age).to eq 18
    end
  end

  context 'When person is under age but have parent permission' do
    it 'can use services' do
      expect(person.can_use_services?).to eq true
    end
  end

  context 'When person is under age and does not have parent permission' do
    let(:person) { Person.new(17, 'John Doe', 1, parent_permission: false) }
    it 'cannot use services' do
      expect(person.can_use_services?).to eq false
    end
  end

  context 'When person is of age' do
    let(:person) { Person.new(18, 'John Doe', 1) }
    it 'can use services' do
      expect(person.can_use_services?).to eq true
    end
  end
end
