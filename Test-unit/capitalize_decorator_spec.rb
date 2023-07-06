require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable', correct_name: 'john doe') }
    let(:decorator) { CapitalizeDecorator.new(nameable) }

    it 'capitalizes the name' do
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
