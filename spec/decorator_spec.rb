require_relative '../decorator.rb'

RSpec.describe Decorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'calls correct_name on the nameable object' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end
  end
end
