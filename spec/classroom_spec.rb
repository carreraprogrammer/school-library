require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('foo') }
  let(:student) { Student.new('foo', 17, 'John Doe', 1) }

  context 'initialize' do
    it 'sets the label correctly' do
      expect(classroom.label).to eq 'foo'
    end
    
    it 'initializes students as an empty array' do
      expect(classroom.students).to be_empty
    end
  end

  context 'when add Student instance' do
    it 'add student to students array' do
      classroom.add_student(student)
      expect(classroom.students.size).to eq 1
    end
  end

  context 'When add a non Student instance' do
    it 'raise an error' do
      expect { classroom.add_student('foo') }.to raise_error('This is not a student!')
    end
  end

  context 'When add a student already in the classroom' do
    it 'raise an error' do
      classroom.add_student(student)
      expect { classroom.add_student(student) }.to raise_error('This student is already in this classroom!')
    end
  end

  context 'setters' do
    it 'change the label correctly' do
      classroom.label = 'New Label'
      expect(classroom.label).to eq 'New Label'
    end
  end
end
