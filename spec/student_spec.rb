require_relative '../student'

describe 'Student' do
  let(:classroom) { Classroom.new('22-a') }
  let(:student) { Student.new(classroom, 17, 'John Doe', 1) }

  context 'When student is initialized' do
    it 'sets the name correctly' do
      expect(student.name).to eq 'John Doe'
    end

    it 'sets the age correctly' do
      expect(student.age).to eq 17
    end

    it 'sets the id correctly' do
      expect(student.id).to eq 1
    end

    it 'sets the classroom correctly' do
      expect(student.classroom).to eq classroom
    end

    it 'sets the parent permission correctly by default' do
      expect(student.parent_permission).to eq true
    end
  end

  context 'When student play hooky' do
    it 'returns the correct message' do
      expect(student.play_hooky).to eq '¯(ツ)/¯'
    end
  end

  context 'When student is added to a classroom' do
    it 'adds the student to the classroom' do
      student.add_classroom = classroom
      expect(classroom.students).to include(student)
    end
  end

  context 'When student information is changed' do
    it 'updates the name' do
      student.name = 'Jane Doe'
      expect(student.name).to eq 'Jane Doe'
    end

    it 'updates the age' do
      student.age = 18
      expect(student.age).to eq 18
    end

    it 'updates the parent permission' do
      student.parent_permission = false
      expect(student.parent_permission).to eq false
    end
  end
end
