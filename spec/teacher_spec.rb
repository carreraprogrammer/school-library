require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 34, 'Jane Doe', 1) }

  context 'When teacher is initialized' do
    it 'sets the name correctly' do
      expect(teacher.name).to eq 'Jane Doe'
    end

    it 'sets the age correctly' do
      expect(teacher.age).to eq 34
    end

    it 'sets the id correctly' do
      expect(teacher.id).to eq 1
    end

    it 'sets the specialization correctly' do
      expect(teacher.specialization).to eq 'Math'
    end

    it 'sets the parent permission correctly by default' do
      expect(teacher.parent_permission).to eq true
    end
  end

  context 'When teacher is asked if can use services' do
    it 'returns true' do
      expect(teacher.can_use_services?).to eq true
    end
  end

  context 'When teacher information is changed' do
    it 'updates the name' do
      teacher.name = 'John Doe'
      expect(teacher.name).to eq 'John Doe'
    end

    it 'updates the age' do
      teacher.age = 35
      expect(teacher.age).to eq 35
    end
  end
end
