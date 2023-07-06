require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable', correct_name: 'VeryLongNameThatNeedsTrimming') }
    let(:decorator) { TrimmerDecorator.new(nameable) }

    it 'trims the name to the first 10 characters' do
      expect(decorator.correct_name).to eq('VeryLongNa')
    end
  end
end