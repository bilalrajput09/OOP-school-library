require_relative '../base_decorator'

RSpec.describe BaseDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable') }
    let(:decorator) { BaseDecorator.new(nameable) }

    it 'delegates the correct_name method to the nameable object' do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
