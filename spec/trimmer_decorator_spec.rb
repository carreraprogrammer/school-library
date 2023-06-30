require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'returns the first 10 characters of the name' do
        allow(nameable).to receive(:correct_name).and_return('VeryLongName')
        expect(subject.correct_name).to eq('VeryLongNa')
      end
    end

    context 'when the name is shorter or equal to 10 characters' do
      it 'returns the original name' do
        allow(nameable).to receive(:correct_name).and_return('ShortName')
        expect(subject.correct_name).to eq('ShortName')
      end
    end
  end
end
